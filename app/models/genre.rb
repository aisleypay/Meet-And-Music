class Genre < ApplicationRecord
  has_many :users, through: :user_genres
end
