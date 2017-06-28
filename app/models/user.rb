class User < ApplicationRecord
  has_secure_password
  belongs_to :meta, polymorphic: true, optional: true
end
