class User < ApplicationRecord
  has_many :usergames
  has_many :games, through: :usergames
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 4 }
end
