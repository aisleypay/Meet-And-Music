class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :state
      t.integer :zipcode
      t.float :latitude
      t.float :longitude
      t.string :setList
      t.integer :age
      t.integer :experience_in_years
      t.boolean :looking_for_band
      t.boolean :looking_for_musicians
      t.integer :radius_preference
      t.references :user

      t.timestamps
    end
  end
end
