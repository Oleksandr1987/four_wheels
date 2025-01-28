class Vehicle < ApplicationRecord
  validates :year, :location, :brand, :model, :state, :price, :engine_volume, :fuel_type, :gear_box, presence: true
  validates :price, numericality: { greater_then: 0 }
  validates :year, numericality: { greater_then: Time.current.year }
  validates :odometer, numericality: { greater_then_or_equal_to: 0 }

  enum state: { new: "new", used: "used" }
  enum transmission: { automatic: "automatic", manual: "manual", variator: "variator" }

  belongs_to :user
  has_many_attached :images
  has_one_attached :video
end
