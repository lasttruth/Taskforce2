class User < ApplicationRecord
  has_many :usergames
  has_many :games, through: :usergames
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 4 }

  def self.find_or_create_from_auth_hash(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.picture = auth.info.image
      user.password = user.password_confirmation = SecureRandom.urlsafe_base64(n=6)
      user.save!
    end
  end

end
