def welcome
    puts "Hi, welcome to all things Studio Ghibli!"
end

def get_search
    puts "\nWhat would you like to know?"
    puts "Type 'help' to see possible searches"
    response = gets.chomp
end

def continue_search
    puts "\nIs there anything else you would want to search? y/n"
    response = gets.chomp
end

def exit_program
    continue = continue_search
    if continue.downcase == 'n' || continue.downcase == 'no'
        return true
    else
        return false
    end
end

def help
    puts "\nHere is a list of possible searches:"
    puts "1. Film by year"
    puts "2. Find a characters species"
    puts "3. Find all characters in a film"
    puts "4. List movies from highest rated to lowest"
    puts "5. See top 3 highest rated movies"
    puts "6. See 3 worst rated movies"
    puts "7. Find all characters of a given species"
    puts "8. exit"
end

def film_by_year
    puts "\nPlease enter the years that you want to search by"
    puts "Start year: "
    year1 = gets.chomp.to_i
    while !year1.is_a?(Integer) do
        puts "Please enter a year, i.e '1990'"
        year1 = gets.chomp
    end
    puts "End year: "
    year2 = gets.chomp.to_i
    while !year1.is_a?(Integer) do
        puts "Please enter a year, i.e '1990'"
        year1 = gets.chomp
    end
    puts "Movies released between the years #{year1} and #{year2} are:\n#{Film.film_search_by_year(year1, year2).join(", ")}"
end

def find_char_species
    puts "\nEnter a character name to find its species"
    character_name = gets.chomp
    puts "#{character_name} is a #{Person.find_species(character_name)}"
end

def find_people_in_film
    puts "\nWhat film do you want to find the characters of?"
    film_name = gets.chomp
    puts "\nThe characters in #{film_name} are:\n#{Film.find_people_in_this_film(film_name).join(", ")}"
end

def list_movies_by_rating
    puts "\nHere is a list of all the movies rated from highest to lowest:"
    puts Film.list_by_rating
end

def top_films
    puts "\n#{Film.highest_rated.join(", ")} are the top 3 films by rating"
end

def worst_films
    puts "\n#{Film.lowest_rated.join(", ")} are the 3 worst films by rating"
end

def find_chars_by_species
    puts "\nEnter a species that's in one of the films"
    puts "Type 'species' to get a list of all the species"
    response = gets.chomp
    if response.downcase == 'species'
        puts "#{species_list}\nEnter a species to search:"
        response = gets.chomp
    end
    p "Characters of the #{response.downcase} species are #{Species.find_all_people_of_species(response)}"
end

def species_list
    return "\nThe species in Ghibli films are:\n#{Species.all.map do |species|
        species[:name]
    end.join("\n")}"
end