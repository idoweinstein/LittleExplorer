from typing import List, Tuple, Dict
import re

import numpy as np
import nltk
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from nltk.stem import PorterStemmer
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

from django.contrib.gis.geos import Point
from app.geolocation import get_coordinates
from app.models import Kindergarten, Users, Connections, Comment


CONNECTION_BONUS = 0.1

nltk.download('punkt', quiet=True)
nltk.download('stopwords', quiet=True)


def main_algo(kindergartens: List[Kindergarten], parent_text_input: str, parent: Users):
    # description is mandatory field and the user input is mandatory field so tfidf_scores must be valid scores for all the list
    descriptions = [kindergarten.description for kindergarten in kindergartens]
    tfidf_scores = tfidf_score(descriptions, parent_text_input)[0]  # we want a flat vector

    # get the kindergarten location score
    location_scores = location_score(kindergartens, parent)

    total_scores = np.array(tfidf_scores) + np.array(location_scores)

    # we make a dict in order to have the kindergarten id as a key
    # this way, we can easily change the scores in the connections function without searching in the list (not efficient)
    # but zip will make a list of tuple, which is immutable so we use map to create from it a list of lists
    kindergarten_scores = list(map(list, zip(kindergartens, total_scores)))
    kindergarten_scores_id_dict = {ks[0].kindergarten_id: ks for ks in kindergarten_scores}

    add_connections_bonus(kindergarten_scores_id_dict, parent)

    # get the tuples fr
    kindergarten_scores = list(kindergarten_scores_id_dict.values())
    # sort the elements by the scores, in descending order
    kindergarten_scores.sort(key=lambda x: x[1], reverse=True)
    # get back just the kindergarten using unzip, in index 0 we will get the tuple of all sorted kindergartens
    return list(zip(*kindergarten_scores))[0]


def preprocess_description(description):
    # remove punctuation
    description = re.sub(r"[\&\#\;\.\!\?\`\'\"\-\/\,(\)\>\<\=\[\]\{\}]", '', description)

    # tokenize the description into separate words
    tokens = word_tokenize(description.lower())

    # remove stopwords and stemming
    stop_words = set(stopwords.words('english'))
    ps = PorterStemmer()
    tokens = [ps.stem(token) for token in tokens if token not in stop_words]

    # get the final string from the processed tokens
    preprocessed_desc = ' '.join(tokens)

    return preprocessed_desc


def tfidf_score(descriptions, user_text_input):
    # get vectorizer model of TfidfVectorizer
    # the model will use preprocess_description function to convert the strings when transforming
    # the model will use unigrams, bigrams and trigrams in the vectorization process
    vectorizer = TfidfVectorizer(preprocessor=preprocess_description, ngram_range=(1, 3))

    # fit the vectorizer on the descriptions
    document_vectors = vectorizer.fit_transform(descriptions)
    # also, transform the user text input into a vector
    short_description_vector = vectorizer.transform([user_text_input])
    # compute the cosine similarity between the user input and every kindergarten description
    similarity_scores = cosine_similarity(short_description_vector, document_vectors)

    return similarity_scores


def location_score(kindergartens: List[Kindergarten], parent: Users):
    # if the user do not have a location saved, the score will be 0 for all the kindergartens
    # when the kindergarten is closer to the locations of the user, the score will be higher
    kindergartens_pnts = [kindergarten.geolocation for kindergarten in kindergartens]
    home_scores = np.zeros(len(kindergartens_pnts))
    work_scores = np.zeros(len(kindergartens_pnts))

    if parent.home_address and parent.home_region:
        home_distances = get_distances_list_from_location(parent.home_address, parent.home_region, kindergartens_pnts)
        home_scores = normalize_location_score(home_distances)

    if parent.work_address and parent.work_region:
        work_distances = get_distances_list_from_location(parent.work_address, parent.work_region, kindergartens_pnts)
        work_scores = normalize_location_score(work_distances)

    return np.array(home_scores) + np.array(work_scores)


def get_distances_list_from_location(address: str, region: str, kindergartens_pnts: List[Point]):
    # get the pnt from location
    location = f"{address} {region}"
    coordinates = get_coordinates(location)
    pnt = Point(coordinates[1], coordinates[0], srid=4326)
    # calculate distances of all kindergartens from this pnt
    return list(map(lambda k: pnt.distance(k), kindergartens_pnts))


def normalize_location_score(distances: List[float]):
    # normalize the distances to be score between 0 and 1
    # the longest (largest) distance is the lowest (higest) score
    min_dist = min(distances)
    max_dist = max(distances)

    # subtract min so min will be 0, and divide by (max-min) to scale
    # then  we do 1-res in order to have long distances mapped to lower scores
    return list(map(lambda d: 1 - ((d - min_dist)/(max_dist - min_dist)), distances))


def add_connections_bonus(kindergarten_scores_id_dict: Dict[int, Tuple[Kindergarten, float]], parent: Users):
    # get all the user ids of the connections of the parent from db
    connectee_ids = Connections.objects.filter(connector__parent_id=parent.parent_id).values_list("connectee", flat=True)
    # get all their comments about kindergartens we want to score
    related_kindergartens = Comment.objects.filter(parent__parent_id__in=connectee_ids, kindergarten__kindergarten_id__in=kindergarten_scores_id_dict.keys())

    # get flatten arrays of the good/bad kindergartens ids based on the comment grade of the connectee
    good_kindergartens_ids = related_kindergartens.filter(grade__in=[4, 5]).values_list("kindergarten", flat=True)
    bad_kindergartens_ids = related_kindergartens.filter(grade__in=[1, 2]).values_list("kindergarten", flat=True)

    # if we have the kindergarten in the list, update its score (for good add, for bas subtract)
    for gk_id in good_kindergartens_ids:
        kindergarten_scores_id_dict[gk_id][1] += CONNECTION_BONUS

    for bk_id in bad_kindergartens_ids:
        kindergarten_scores_id_dict[bk_id][1] -= CONNECTION_BONUS
