class User < ApplicationRecord
  has_secure_password
  has_many :bands
  has_many :artists
  accepts_nested_attributes_for :bands, :artists
end
