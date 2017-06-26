class Decision < ApplicationRecord
  belongs_to :decider_id, class_name: 'User'
  belongs_to :chosen_id, class_name: 'User'
  validate :different_users

  def different_users
    if self.deciderId == self.chosen_id
      errors.add(:chosen_id, "Cannot be the same user")
    end
  end
end
