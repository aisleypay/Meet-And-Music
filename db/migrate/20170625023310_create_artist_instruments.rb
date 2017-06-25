class CreateArtistInstruments < ActiveRecord::Migration[5.1]
  def change
    create_table :artist_instruments do |t|
      t.references :artist, foreign_key: true
      t.references :instrument, foreign_key: true

      t.timestamps
    end
  end
end
