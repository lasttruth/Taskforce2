class Game < ApplicationRecord
  has_and_belongs_to_many :users, optional: true
  validates :title, presence: true
end
