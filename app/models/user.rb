class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :trackable

  has_one :wallet

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  before_save :ensure_authentication_token

  def full_name
    "#{first_name} #{last_name}"
  end

  def ensure_authentication_token
    self.authentication_token ||= generate_authentication_token
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).exists?
    end
  end
end
