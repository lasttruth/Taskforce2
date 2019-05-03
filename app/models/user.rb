class User < ApplicationRecord
  has_and_belongs_to_many :games

  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 4 }
end
