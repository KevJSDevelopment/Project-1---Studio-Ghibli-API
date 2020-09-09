class Person < ActiveRecord::Base
    belongs_to :film
    belongs_to :species
    has_many :person_locations
    has_many :locations, through: :person_locations
end