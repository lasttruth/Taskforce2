class Game < ApplicationRecord
  has_many :statuses
  has_many :users, through: :statuses
  validates :title, presence: true

  scope :ordered, -> { order('created_at desc') }
end
