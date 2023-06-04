import nltk
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from nltk.stem import PorterStemmer
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

nltk.download('punkt', quite=True)
nltk.download('stopwords', quiet=True)

def main_algo(kindergarten_list):
    pass

def preprocess_description(description):
    # tokenize the description into separate words
    tokens = word_tokenize(description.lower())

    # remove stopwords and stemming
    stop_words = set(stopwords.words('english'))
    ps = PorterStemmer()
    # TODO: try to see which more stop words needed
    # stop_words.add('kindergarten')
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