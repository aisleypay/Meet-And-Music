class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :classification
  has_many :bands, serializer: UserBandSerializer
  has_many :artists, serializer: UserArtistSerializer
end
