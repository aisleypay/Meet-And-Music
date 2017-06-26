class UserArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :state, :zipcode, :setList, :age, :experience_in_years, :genres, :instruments
end
