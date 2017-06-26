class UserBandSerializer < ActiveModel::Serializer
  attributes :id, :name, :state, :zipcode, :setList, :genres
end
