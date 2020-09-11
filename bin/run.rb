require_relative '../config/environment.rb'
require_relative '../lib/console_communicator.rb'
require 'colorize'

exit_app = false

welcome
while exit_app == false do 
    response = get_search

    if response.downcase == 'help'
        help
        response = get_search
    end

    if response.to_i == 1 || response.downcase == "film by year"
        film_by_year
        exit_app = exit_program
    elsif response.to_i == 2 || response.downcase == "find a characters species"
        find_char_species
        exit_app = exit_program
    elsif response.to_i == 3 || response.downcase == "find all people in a film"
        find_people_in_film
        exit_app = exit_program
    elsif response.to_i == 4 || response.downcase == "list movies from highest rated to lowest"
        list_movies_by_rating
        exit_app = exit_program
    elsif response.to_i == 5 || response.downcase == "see top 3 highest rated movies"
        top_films
        exit_app = exit_program
    elsif response.to_i == 6 || response.downcase == "see 3 worst rated movies"
        worst_films
        exit_app = exit_program
    elsif response.to_i == 7 || response.downcase == "find all characters of a given species"
        find_chars_by_species
        exit_app = exit_program
    elsif response.to_i == 8 || response.downcase == "exit"
        exit_app = true
    end

end
#elsif 

# p Person.find_species("Ashitaka")
# p Film.find_people_in_this_film("My Neighbor Totoro")
# p Film.highest_rated
# p Film.lowest_rated
# p Film.list_by_rating
# p Species.find_all_people_of_species("Deer")