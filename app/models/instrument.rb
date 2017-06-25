class Instrument < ApplicationRecord
  has_many :artists, through: :artist_instruments
end
