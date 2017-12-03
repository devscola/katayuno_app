# Katayuno App

This application is done for handle code katas and people examples for the event of Devscola's Katayuno.

Too it is an example for the Rails nini-run of Devscola at December 2017.

## Instalation requirements
### With docker

- Docker version 17.03.0-ce (or higher)
- docker-compose version 1.11.2 (or higher)

### Without docker

- ruby 2.4.0p0 (or higher)
- System libraries build-essential, libpq-dev, nodejs

## Installation
### Without docker

Run the follow commands:
- `gem install bundle`
- `bundle install`

## Run the tests
### With docker

Run the follow command:
- `docker-compose run web rake`

### Without docker

Run the follow command:

- `bundle exec rspec`

## Run the application
### With docker

Run the follow command:
- `docker-compose up --build`

### Withour docker

Run the follow command:
- `bundle exec rake db:migrate`
- `rails s`
