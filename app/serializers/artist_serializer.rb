class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :state, :zipcode, :setList, :age, :experience_in_years, :profile_pic
  has_many :instruments
  has_many :genres
  has_one :user
end
