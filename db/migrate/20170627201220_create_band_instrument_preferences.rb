class CreateBandInstrumentPreferences < ActiveRecord::Migration[5.1]
  def change
    create_table :band_instrument_preferences do |t|
      t.references :band, foreign_key: true
      t.references :instrument, foreign_key: true

      t.timestamps
    end
  end
end
