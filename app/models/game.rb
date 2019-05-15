class Game < ApplicationRecord
  has_many :usergames
  has_many :users, through: :usergames
  validates :title, presence: true

  scope :ordered, -> { order('created_at desc') }
end
