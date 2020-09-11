def welcome
    puts "Hi, welcome to all things Studio Ghibli!".white.on_light_green
end

def get_search
    puts "\nWhat would you like to know?".light_yellow.on_light_blue
    puts "Type 'help' to see possible searches"
    response = gets.chomp
end

def continue_search
    puts "\nIs there anything else you would want to search? y/n".light_yellow.on_light_blue
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
    puts "\nHere is a list of possible searches:".light_yellow.on_light_blue
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
    puts "\nPlease enter the years that you want to search by".light_yellow.on_light_blue
    puts "Start year: "
    year1 = gets.chomp.to_i
    while !year1.is_a?(Integer) do
        puts "Please enter a year, i.e '1990'".light_yellow.on_light_blue
        year1 = gets.chomp
    end
    puts "End year: "
    year2 = gets.chomp.to_i
    while !year1.is_a?(Integer) do
        puts "Please enter a year, i.e '1990'".light_yellow.on_light_blue
        year1 = gets.chomp
    end
    puts "Movies released between the years #{year1} and #{year2} are:\n#{Film.film_search_by_year(year1, year2).join(", ")}"
end

def find_char_species
    puts "\nEnter a character name to find its species".light_yellow.on_light_blue
    character_name = gets.chomp
    puts "#{Person.find_species(character_name)}"
end

def find_people_in_film
    puts "\nWhat film do you want to find the characters of?".light_yellow.on_light_blue
    puts "Type 'films' to get a list of films"
    film_name = gets.chomp
    while film_name.downcase == "films" do
        puts "#{film_list}\nEnter a film you wish to see the characters of:"
        film_name = gets.chomp
    end
    if Film.find_people_in_this_film(film_name).is_a?(String)
        puts Film.find_people_in_this_film(film_name)
    else
        puts "\nThe characters in #{film_name} are:".light_yellow.on_light_blue
        puts "\n#{Film.find_people_in_this_film(film_name).join(", ")}"
    end
end

def list_movies_by_rating
    puts "\nHere is a list of all the movies rated from highest to lowest:".light_yellow.on_light_blue
    puts Film.list_by_rating
end

def top_films
    puts "\n#{Film.highest_rated.join(", ")} are the top 3 films by rating"
end

def worst_films
    puts "\n#{Film.lowest_rated.join(", ")} are the 3 worst films by rating"
end

def find_chars_by_species
    puts "\nEnter a species that's in one of the films".light_yellow.on_light_blue
    puts "Type 'species' to get a list of all the species"
    response = gets.chomp
    while response.downcase == 'species' do
        puts "#{species_list}\nEnter a species to search:"
        response = gets.chomp
    end
    puts "Characters of the #{response.downcase} species are:".light_yellow.on_light_blue
    puts Species.find_all_people_of_species(response)
end

def species_list
    puts "\nThe species in Ghibli films are:".light_yellow.on_light_blue
    return Species.all.map do |species|
        species[:name]
    end.join("\n")
end

def film_list
    puts "\nAll the films made by Studio Ghibli are:".light_yellow.on_light_blue
    return Film.all.map do |film|
        film[:title]
    end.join("\n")
end