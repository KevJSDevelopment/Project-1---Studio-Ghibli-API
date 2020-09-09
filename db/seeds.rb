require 'rest-client'
require 'json'
require 'pry'

def get_films
    api = RestClient.get('https://ghibliapi.herokuapp.com/films')
    api_hash = JSON.parse(api)
    api_hash
end

def get_people
    api = RestClient.get('https://ghibliapi.herokuapp.com/people')
    api_hash = JSON.parse(api)
    api_hash
    # binding.pry
end

def get_locations
    api = RestClient.get('https://ghibliapi.herokuapp.com/locations')
    api_hash = JSON.parse(api)
    api_hash
    binding.pry
end

def get_species
    api = RestClient.get('https://ghibliapi.herokuapp.com/species')
    api_hash = JSON.parse(api)
    api_hash
    binding.pry
end

def create_film_data
    get_films.each do |film|
        Film.create({title: film["title"], description: film["description"], release_date: film["release_date"], rating: film["rt_score"]})
    end
end

create_film_data