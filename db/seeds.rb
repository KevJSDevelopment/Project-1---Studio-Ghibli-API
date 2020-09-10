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
    #binding.pry
end

def get_locations
    api = RestClient.get('https://ghibliapi.herokuapp.com/locations')
    api_hash = JSON.parse(api)
    api_hash
    #binding.pry
end

def get_species
    api = RestClient.get('https://ghibliapi.herokuapp.com/species')
    api_hash = JSON.parse(api)
    api_hash
    #binding.pry
end

# def create_film_data
#     get_films.each do |film|
#         Film.create({title: film["title"], description: film["description"], release_date: film["release_date"], rating: film["rt_score"]})
#     end
# end

# def create_species_data
#     get_species.each do |species|
#         Species.create({name: species["name"], classification: species["classification"]})
#     end
# end

# def create_person_data
#     get_people.each do |person|
#         film_id = 0
#         species_id = 0
#         Film.all.each do |film|
#             film_api = RestClient.get(person["films"][0])
#             film_hash = JSON.parse(film_api)
#             if film["title"] == film_hash["title"]
#                 film_id = film[:id]
#             end
#         end
#         Species.all.each do |species|
#             species_api = RestClient.get(person["species"])
#             species_hash = JSON.parse(species_api)
#             if species["name"] == species_hash["name"]
#                 species_id = species[:id]
#             end
#         end
#         Person.create({name: person["name"], gender: person["gender"], film_id: film_id, species_id: species_id})
#     end
# end

# def create_location_data
#     get_locations.each do |location|
#         Location.create({name: location["name"], terrain: location["terrain"]})
#     end
# end

# def create_person_location_data
#     person_id = 0
#     location_id = 0
#     get_locations.each do |location|
#         if location["residents"] != [] || location["residents"] != ["TODO"]
#             location["residents"].each do |resident_url|
#                 resident = RestClient.get(resident_url)
#                 resident_hash = JSON.parse(resident)
#                 resident_hash
#                 Person.all.each do |person|
#                     if person[:name] == resident_hash["name"]
#                         person_id = person[:id]
#                     end
#                 end
#                 Location.all.each do |location_|
#                     if location_[:name] == location["name"]
#                         location_id = location_[:id]
#                     end
#                 end
#                 PersonLocation.create({person_id: person_id, location_id: location_id})        
#             end
#         else
#             puts "data not available"
#         end
#     end
# end
