class FriendRequest < ApplicationRecord
  belongs_to :sent_by, class_name: 'User'
  belongs_to :sent_to, class_name: 'User'

  validate :not_self

  def not_self
    errors.add(:sent_to, "can't be the same as user") if sent_by == sent_to
  end
end
