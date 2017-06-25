class Band < ApplicationRecord
  has_secure_password
  geocoded_by :zipcode
  after_validation :geocode
  has_many :user_genres
  has_many :genres, through: :user_genres
  accepts_nested_attributes_for :genres

end
