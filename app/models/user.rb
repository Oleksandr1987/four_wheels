class User < ApplicationRecord
  validates :first_name, :last_name, :phone, :email, presence: true
  validates :email, uniqueness: true
  validates :phone, numericality: { only_integer: true}, length: { minimum: 10, maximum: 12 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :vehicles
  has_secure_password validations: false
  validate :password_presence

  private

  def password_presence
    errors.add(:password, :blank) if password_digest.blank?
  end
end
