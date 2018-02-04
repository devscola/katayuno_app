# Katayuno App

This application is done for handle code katas and people examples for the event of Devscola's Katayuno.

Too it is an example for the Rails nini-run of Devscola at December 2017.

## Instalation requirements
### With docker

- Docker version 17.03.0-ce (or higher)
- docker-compose version 1.11.2 (or higher)

### Without docker

- ruby 2.4.0p0 (or higher)
- System libraries: build-essential, libpq-dev, nodejs

## Installation
### Without docker

Run the follow commands:
- `gem install bundle`
- `bundle install`
- `bundle exec rake db:migrate`

## Run the tests
### With docker

Run the follow command:
- `docker-compose run web rake`

### Without docker

Run the follow command:

- `bundle exec rake`

## Run the application
### With docker

Run the follow command:
- `docker-compose up --build`

### Withour docker

Run the follow command:
- `bundle exec rake db:migrate`
- `rails s`

## When the application is running

You can access to the application using the next URL in your browser:

- `localhost:3000`

# Contributions

Your are free to contribute with the application.

## Git repository

The application code is in [this](https://github.com/zerolive/katayuno_app) github repository.

## Continuous integration

The github repository is integrated with a travis-ci that run tests with every new commit or pull request, you can check it [here](https://travis-ci.org/zerolive/katayuno_app).

## Auto deployments

After a new commit in the master branch pass the CI, automatly the application is deployed in a heroku machine. Visit the application click in [here](https://katayuno-app.herokuapp.com/).
