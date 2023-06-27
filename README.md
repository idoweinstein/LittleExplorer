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

1. Open a terminal and run the following command:

```bash
$ pip install -r requirements.txt
```

2. Create a local DB:
    - install [MySQL](https://dev.mysql.com/doc/mysql-installation-excerpt/5.7/en/) by following the appropriate installation instructions for
      your operating system.
    - Create a new user and grant permissions in MySQL by following the instruction
      in [this link](https://phoenixnap.com/kb/how-to-create-new-mysql-user-account-grant-privileges).
    - open a terminal and run the following commands, replace `<user>` by the user that was added in the previous step:

```bash
$ mysqladmin -u <user> -p create LittleExplorer
$ mysql -u <user> -p LittleExplorer < db.sql
```

3. Install GDAL by following [this guide](https://mapscaping.com/installing-gdal-for-beginners/)
4. In your working directory run:

```bash
$ git clone https://github.com/idoweinstein/LittleExplorer.git
$ cd LittleExplorer
$ python3 manage.py runserver
```

5. Access http://127.0.0.1:8000/ and enjoy

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
1. As described above, a teacher may add a description to her kindergarten.
The first aspect is a **similarity score** between the input query and the descriptions of the kindergartens.
The algorithm we chose for this task is the **TF-IDF** algorithm which uses frequency of words to determine how relevant those words are to a given description and often used in such searching problems.
To get a more accurate result we pre-processed the data by using **stemming** and **removing stop words**.
We also found out that an **n-gram** version of the algorithm, which takes **word sequences** into account resulted in a more accurate match.

2. The second aspect is the **proximity** of the kindergarten to the user's **home and work addresses**.
The higher the proximity, the higher the score of the kindergarten.

3. The third aspect is the **"User's Connection Insight"**.
If a kindergarten got a "good" rating from a connection it will get a small score boost and if it got a "bad" rating it will receive a small penalty to its score.

###technical explanation:
When a user searches via the smart search (or any other search) the value and the method are send to the function "search" in views.py.
**ido will explain about it.**
Then in get_filtered_kindergarten function inside search - **ido will explain**.
At the end of this function we have the "advanced" option which sends the list of the kindergartens to the main_algo function in algorithm.py

The main_algo function receives the list of the kindergartens and make 3 function calls to get the scores of the 3 aspects we mentioned.
First, it constructs a list of all the kindergartens' description and send them to the tfidf_function in the same python file.
tfidf_score calculates the tfidf score and the cosine similarity of the user input and all the kindergartens' descriptions.
It uses the preprocess_description function we wrote in the same file.

The next function in the main_algo is location_score which calculates the distances from the home and work addresses of the user and normalizes it to be a score from 0 to 1.

Finally, we have the add_connection_bonus function, also in the same file, which gets from the db all the user's connection and check if they gave rating to a kindergarten and change its score accordingly.

We sort the results based on the final score in main_algo function and send them back to the get_filtered_kindergartens function that called it. 

## Demo of the smart search algorithm

[![Watch the video](mq1.webp)](https://youtu.be/Lmjltjjg57Q)






