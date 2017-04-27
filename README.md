# Fandor Films API
The Fandor films API allows you to retrieve a list of films, retrieve a specific film & rate a film.

## Setup

git clone

rake db:migrate RAILS_ENV=development

rake db:migrate RAILS_ENV=test

rake db:seed

#### Installing POW-MAC OS for sub-domain

 *curl get.pow.cx | sh*
 
 *cd ~/.pow*
 
 then create a symlink
 
 *ln -s ~/path_to_repo*
 
 #### Installing Prax-Linux users for sub-domain
 
 *sudo git clone git://github.com/ysbaddaden/prax.git /opt/prax*
 
 *cd /opt/prax/*
 
 *./bin/prax install*
 
 *cd ~/path_to_repo*
 
 *prax link*
 
 If you want to start the prax server automatically, add this line to the .profile file:
 
 *prax start*
 
 I use [Postman](https://www.getpostman.com/) for API client.
 
 To retrieve a list of all the films. GET http://api.fandor-films-api.dev/films/
 
[Example](http://imgur.com/a/BkjwL)

To rate a film. POST whatever film_id http://api.fandor-films-api.dev/films/3/film_ratings/

[Example](http://imgur.com/a/mVNFs)

Retrieving a specifc film based on attributes currently are by time, title, description, url_slug, year, related_film and average-rating. GET http://api.fandor-films-api.dev/films/?average_rating=3

[Example](http://imgur.com/a/Zl6o1)
