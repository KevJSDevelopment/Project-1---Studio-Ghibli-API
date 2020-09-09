class Location < ActiveRecord::Base
    has_many :person_locations
    has_many :people, through: :person_locations
end