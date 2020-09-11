class Film < ActiveRecord::Base
    has_many :people

    def self.film_search_by_year(start_year, end_year)
        self.all.select do |film|
            film[:release_date] >= start_year && film[:release_date] <= end_year
        end.map do |film|
            film[:title]
        end
    end

    def self.find_film(film_name)
        found_film = Film.all.find do |film|
            film[:title].downcase == film_name.downcase
        end
        if found_film == nil
            return ""
        else
            return found_film
        end
    end

    
    def self.find_people_in_this_film(film_name)
        found_film = self.find_film(film_name)
        if found_film.is_a?(String)
            return "Sorry, we couldn't find that film"
        else
            Person.all.select do |person|
                person[:film_id] == found_film[:id]
            end.map do |person|
                person[:name]
            end
        end
    end
    
    def self.highest_rated
        Film.all.max_by(3) do |film|
            film[:rating]
        end.map do |film|
            film[:title]
        end
    end
    
    def self.lowest_rated
        Film.all.min_by(3) do |film|
            film[:rating]
        end.map do |film|
            film[:title]
        end
    end
    
    def self.list_by_rating
        Film.all.sort_by{|film| -film[:rating]}.map do |film|
            film[:title]
        end
    end
    
    # def self.find_film_id_by_name(film_title)
    #     found_film = Film.all.find do |film|
    #         film[:title] == film_title
    #     end
    #     found_film[:id]
    #     # binding.pry
    # end

    # def self.film_locations(film)
    #     film_id = self.find_film_id_by_name(film)
    #     Person.all.select do |person|
    #         person[:film_id] == film_id
    #         # binding.pry
    #     end.map do |person|
    #         person.locations
    #     end
    # end

end
#binding.pry