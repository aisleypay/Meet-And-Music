class UserMetaSerializer < ActiveModel::Serializer
  attributes :id, :name, :state, :zipcode, :setList, :genres
end
