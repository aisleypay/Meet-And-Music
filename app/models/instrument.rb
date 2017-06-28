class Instrument < ApplicationRecord
  has_many :artist_instruments
  has_many :artists, through: :artist_instruments
  has_many :band_instrument_preferences
  has_many :bands, through: :band_instrument_preferences
end
