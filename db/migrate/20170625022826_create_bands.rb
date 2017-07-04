class CreateBands < ActiveRecord::Migration[5.1]
  def change
    create_table :bands do |t|
      t.string :name
      t.string :state
      t.string :zipcode
      t.float :latitude
      t.float :longitude
      t.integer :radius_preference
      t.string :setList
      t.boolean :looking_for_musicians
      t.string :profile_pic
      t.string :youtube_playlist_link
      t.references :user

      t.timestamps
    end
  end
end
