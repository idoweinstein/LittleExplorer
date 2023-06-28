# Welcome to LittleExplorer 👋

##Team Members
Shir Naiberg, Almog Altman, Daniel Jaffe, Ido Weinstein

[//]: # (# Description)

## LittleExplorer in a nutshell
**A faster and improved web app to find the best kindergarten for your kid**

shir will send me

## What you can do

### As a teacher / kindergarten owner:

- Add a kindergarten with the relevant information
- See the kindergarten page with the information and the reviews

### As a parent:

- Search kindergartens by name or location
- Filter results based on different filters such as opening hours, maximum number of kids in kindergarten etc
- Access the different kindergartens pages to get relevant information about them
- Read comments about the different kindergartens
- Share your Insights about your child’s kindergarten
- Connect to people you trust
- Smart search for results fitted just for you (further detail in the smart search section)
- Register your kid to a kindergarten

## Demo of the basic functionality within the app

[![Watch the video](mq1.webp)](https://www.youtube.com/watch?v=zFsguMNPFKk)

## Installation

In order to get the app running, follow the instructions below:

1. Create a local DB:
    - install [MySQL](https://dev.mysql.com/doc/mysql-installation-excerpt/5.7/en/) by following the appropriate installation instructions for
      your operating system.
    - Create a new user and grant permissions in MySQL by following the instruction
      in [this link](https://phoenixnap.com/kb/how-to-create-new-mysql-user-account-grant-privileges).

2. Install GDAL by following [this guide](https://mapscaping.com/installing-gdal-for-beginners/)
3. In your working directory run (replace `<user>` by the user that was added in step 2):

```bash
$ git clone https://github.com/idoweinstein/LittleExplorer.git
$ cd LittleExplorer
$ pip install -r requirements.txt
$ mysqladmin -u <user> -p create LittleExplorer
$ mysql -u <user> -p LittleExplorer < db.sql
$ python3 manage.py runserver
```

4. Access http://127.0.0.1:8000/ and enjoy

## Project structure

The main portion of the code can be found under `app` package:

- Under `app/static` folder all the CSS and JS code can be found. While most of it is fairly straightforward, there is one file worth noting: 
  `app/static/search.js`. This file specifically handles the search filters and map view controls.
  In addition, all the images that are used across the
  website can be found under `app/static/images` folder.
- Under `app/templates` folder all the html templates can be found.
- In `app/algorithm.py` you can find the code used for the smart search option.
- In `app/forms.py` you can find the different forms that we added inside the web app ( for instance new comment form).
- In `app/models.py` you can find the different [django models](https://docs.djangoproject.com/en/4.2/topics/db/models/)
  used within the web app.
- In `app/search.py` you can find the code that is used for the search by name and search by location features.
- In `app/urls.py` you can see all the different enpoints that are used in our web app.
- In `app/views.py` you can see all the [django views](https://docs.djangoproject.com/en/4.2/topics/http/views/) that are used in the app.

In the root folder:
- `db.sql` is a dump of our database. 

## Deep dive into the Smart Search Feature

Our Smart Search algorithm has 3 aspects which are considered:
1. **TF-IDF (description similarity)** - As described above, a teacher may add a description to his/her kindergarten.
The first aspect is a **similarity score** between the input query and the descriptions of the kindergartens.
The algorithm we chose for this task is the **TF-IDF** algorithm which uses frequency of words to determine how relevant those words are to a given description and often used in such searching problems.
To get a more accurate result we pre-processed the data by using **stemming** and **removing stop words**.
We also found out that an **n-gram** version of the algorithm, which takes **word sequences** into account resulted in a more accurate match.

2. **Distance** - The second aspect is the **proximity** of the kindergarten to the user's **home and work addresses**.
The higher the proximity, the higher the score of the kindergarten.

3. **Connections** - The third aspect is the **"User's Connection Insight"**.
If a kindergarten got a "good" rating from a connection it will get a small score boost and if it got a "bad" rating it will receive a small penalty to its score.

### Technical explanation
Flow of the smart search feature is as follows:
- User enters a search query, chooses the smart search option and hits the search button.
- Backend receives the search request and calls `search` function in `app/views.py`.
- Then `get_boundaries_of_fields` in `app/search.py` is called, and sets the desired values of the front-end filters (minimum, maximum and chosen value).
- `get_filtered_kindergartens` in `app/search.py` is then called and:
  - Sets required back-end filters for our search option. For smart search, no filters are required.
  - Fetches the data from our DB.
  - In the location and smart search options - sorts the results by relevance. The relevance score of smart search results is calculated by `main_algo` in `app/algorithm.py`.
- The `main_algo` function receives the list of the kindergartens and make 3 function calls to get the scores of the 3 aspects we mentioned:
  - First, it constructs a list of all the kindergartens' description and send them to the `tfidf_score` function in the same python file.
`tfidf_score` calculates the TF-IDF score and the cosine similarity of the user input and all the kindergartens' descriptions.
It uses the `preprocess_description` function which performs the stemming and removes stop words.
  - The next function in the `main_algo` is `location_score` which calculates the distances from the home and work addresses of the user and normalizes it to be a score from 0 to 1.
  - Finally, we have the `add_connection_bonus` function, also in the same file, which gets all the user's connection from the DB. Then, it checks if they rated the kindergarten and change its score accordingly.


## Demo of the smart search algorithm

[![Watch the video](mq1.webp)](https://youtu.be/Lmjltjjg57Q)

## Front-end filtering
For the sake of smoother user experience, most search filtering logic is implemented in front-end.
When the `apply` button is clicked, it triggers `applyFilters` function which calls `filterKindergartens` in `app/static/search.js`.
This feature is displayed here: https://youtu.be/zFsguMNPFKk?t=132






