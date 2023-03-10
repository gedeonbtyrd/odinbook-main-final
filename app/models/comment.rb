class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :content, presence: true

  scope :sorted_by_date, -> { order(created_at: :asc) }
end
