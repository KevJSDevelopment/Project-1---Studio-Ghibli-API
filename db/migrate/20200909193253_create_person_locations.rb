class CreatePersonLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :person_locations do |t|
      t.integer :person_id
      t.integer :location_id
    end
  end
end
