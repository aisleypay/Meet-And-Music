class UserGenre < ApplicationRecord
  belongs_to :artist, optional: true
  belongs_to :band, optional: true
  belongs_to :genre
end
