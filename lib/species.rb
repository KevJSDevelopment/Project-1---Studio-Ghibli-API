class Species < ActiveRecord::Base
    has_many :people

    def self.find_species(species_name)
        self.all.find do |species|
            species[:name] == species_name
        end
    end

    def self.find_all_people_of_species(species_name)
        found_species = self.find_species(species_name)
        Person.all.select do |person|
            person[:species_id] == found_species[:id]
        end.map do |person|
            person[:name]
        end.join(", ")
    end
end