class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :gender
      t.integer :species_id
      t.integer :film_id
    end
  end
end
