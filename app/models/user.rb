# Class for model User
class User < ApplicationRecord
  before_create :generate_token
  validates :email, presence: true
  validates :username, presence: true
  has_secure_password

  private

  def generate_token
    token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s)
    self.remember_token = token
  end
end