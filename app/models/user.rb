class User < ApplicationRecord
  validates :first_name, :last_name, :phone, :email, presence: true
  validates :email, uniqueness: true
  validates :phone, numericality: { only_integer: true}, length: { minimum: 10, maximum: 12 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :vehicles
end
