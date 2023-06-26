# Welcome to LittleExplorer 👋

[//]: # (# Description)

**A faster and improved web app to find the best kindergarten for your kid**

shir will send me

## Installation

In order to get the app running follow the instructions below:

1. Open a terminal and run the following command:

```bash
$ pip install -r requirements.txt
```

2. Create a local DB:
    - install MySQL by following the appropriate installation instructions for
      your [operating system](https://dev.mysql.com/doc/mysql-installation-excerpt/5.7/en/).
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

## What you can do

### As a teacher / kindergarten owner:

- Add a kindergarten with the relevant information
- See the kindergarten page with the information page and the
  reviews page

### As a parent:

- Search kindergartens by name or location
- Filter results based on different filters such opening hours, maximum number of kids in kindergarten etc.
- Access the different kindergartens pages to get relevant information about them.
- Read comments about the different kindergarten available
- Share your Insights about your child’s kindergarten
- Connect to people you trust
- Smart search for results fitted just for the parent (further detail in the smart search section)
- Register your kid to a kindergarten

## Demo of the basic functionality within the app

[![Watch the video](mq1.webp)](https://www.youtube.com/watch?v=zFsguMNPFKk)

## Project structure

The main portion of the code can be found under `app package`:

- Under `static` folder all the css, and js code can be found. In addition, all the images that are used across the
  website can be found under `static/images` folder.
- Under `templates` folder all the html templates can be found
- In `algorithm.py` you can find the code used for the smart search option.
- In `forms.py` you can find the different forms that we added inside the web app ( for instance new comment form)
- In `models.py` you can find the different [django models](https://docs.djangoproject.com/en/4.2/topics/db/models/)
  used within the web app.
- In `search.py` you can find the code that is used for the search by name and search by location features
- In `urls.py` you can see all the different enpoints that are used in our web app
- In `views.py` you can see all the [django views](https://docs.djangoproject.com/en/4.2/topics/http/views/) that are used in the app

## Deep dive into the Smart Search Feature

Almog will send me

## Demo of the smart search algorithm

[![Watch the video](mq1.webp)](https://youtu.be/Lmjltjjg57Q)






