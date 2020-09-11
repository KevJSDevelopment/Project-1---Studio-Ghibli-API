class Species < ActiveRecord::Base
    has_many :people

    def self.find_species(species_name)
        found_species = self.all.find do |species|
            species[:name] == species_name
        end
        if found_species == nil
            return ""
        else
            return found_species
        end
    end

    def self.find_all_people_of_species(species_name)
        found_species = self.find_species(species_name)
        if found_species.is_a?(String)
            return "The species you entered is not in our list"
        else
            return Person.all.select do |person|
                person[:species_id] == found_species[:id]
            end.map do |person|
                person[:name]
            end.join(", ")
        end
    end
end