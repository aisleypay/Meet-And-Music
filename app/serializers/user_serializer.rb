class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :meta_type
  belongs_to :meta, serializer: UserMetaSerializer
end
