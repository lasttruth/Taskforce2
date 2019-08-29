class Game < ApplicationRecord
  has_many :statuses
  has_many :users, through: :statuses
  validates :title, presence: true

  scope :ordered, -> { order('created_at desc') }

  def self.search(search)
    if search
        Game.where('lower(title) LIKE ?', "%#{search.downcase}%")
      else
        all
    end
  end

end
