class Band < ApplicationRecord
  geocoded_by :zipcode
  after_validation :geocode
  has_many :user_genres
  has_many :genres, through: :user_genres
  accepts_nested_attributes_for :genres
  belongs_to :user

  def self.search_bands_by_radius(coordinates, radius)
    Band.near(coordinates, radius)
  end
end
