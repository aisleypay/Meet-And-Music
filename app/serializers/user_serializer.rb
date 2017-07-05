class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :meta_type, :email
  belongs_to :meta, serializer: UserMetaSerializer
end
