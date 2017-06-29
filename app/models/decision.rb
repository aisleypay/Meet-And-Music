class Decision < ApplicationRecord
  belongs_to :decider, class_name: 'User', foreign_key: 'decider_id'
  belongs_to :chosen, class_name: 'User', foreign_key: 'chosen_id'
  accepts_nested_attributes_for :decider
  validate :different_users

  def different_users
    errors.add(:chosen_id, 'Cannot be the same user') if decider_id == chosen_id
  end
end
