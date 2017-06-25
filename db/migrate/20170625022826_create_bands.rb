class CreateBands < ActiveRecord::Migration[5.1]
  def change
    create_table :bands do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :state
      t.integer :zipcode
      t.float :latitude
      t.float :longitude
      t.string :setlist

      t.timestamps
    end
  end
end
