class Band < ApplicationRecord
  geocoded_by :zipcode
  after_validation :geocode
  has_one :user, as: :meta, dependent: :destroy
  has_many :user_genres, dependent: :destroy
  has_many :genres, through: :user_genres
  has_many :band_instrument_preferences, dependent: :destroy
  accepts_nested_attributes_for :user, :genres, :band_instrument_preferences, :user_genres

  def self.search_bands_by_radius(coordinates, radius)
    Band.near(coordinates, radius)
  end

  def self.selected_by_instruments_artists(bands, artist_instruments)
    bands.map do |b|
      b_preferred_instruments = b.band_instrument_preferences.collect { |p| p.instrument.name }
      if artist_instruments.any? { |a_instrument| b_preferred_instruments.include?(a_instrument) }
        b
      end
    end
  end

  def self.recommendedBands(coordinates, radius, artist_instruments)
    geographically_selected_bands = search_bands_by_radius(coordinates, radius)
    selected_by__needed_instruments(geographically_selected_bands, artist_instruments)
  end
end
