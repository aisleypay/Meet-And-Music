class Genre < ApplicationRecord
  has_many :user_genres
  has_many :artists, through: :user_genres
  has_many :bands, through: :user_genres
end
