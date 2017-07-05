class User < ApplicationRecord
  has_secure_password
  belongs_to :meta, polymorphic: true, optional: true
  has_many :decisions, foreign_key: 'chosen_id', dependent: :destroy
  has_many :decisions, foreign_key: 'decider_id', dependent: :destroy
end
