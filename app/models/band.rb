class Band < ApplicationRecord
  geocoded_by :zipcode
  after_validation :geocode
  has_one :user, as: :meta, dependent: :destroy
  has_many :user_preferences, as: :beta, dependent: :destroy
  has_many :user_genres, dependent: :destroy
  has_many :genres, through: :user_genres
  has_many :band_instrument_preferences, dependent: :destroy
  accepts_nested_attributes_for :user, :genres, :band_instrument_preferences, :user_genres

  def self.search_bands_by_radius(coordinates, radius)
    Band.near(coordinates, radius)
  end
end
