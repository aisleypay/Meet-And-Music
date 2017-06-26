class BandSerializer < ActiveModel::Serializer
  attributes :id, :name, :state, :zipcode, :setList
  has_many :genres
end
