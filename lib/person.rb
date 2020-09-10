class Person < ActiveRecord::Base
    belongs_to :film
    belongs_to :species
    has_many :person_locations
    has_many :locations, through: :person_locations

    def self.find_species(person_name)
        found_person = self.find_person_by_name(person_name)
        if found_person.is_a?(String)
            return "The person you searched for is not in any studio ghibli film"
        else
            Species.all.find do |species|
                species[:id] == found_person[:species_id]
            end[:name]
        end
    end

    def self.find_person_by_name(person_name)
        found_person = self.all.find do |person|
            person[:name] == person_name
        end
        if found_person != nil
            return found_person
        else
            return ""
        end
    end
end