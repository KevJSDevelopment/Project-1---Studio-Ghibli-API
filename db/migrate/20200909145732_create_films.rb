class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.string :title
      t.text :description
      t.integer :release_date
      t.integer :rating
    end
  end
end
