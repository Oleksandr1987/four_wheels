class Vehicle < ApplicationRecord
  belongs_to :user
  validates :year, :region, :brand, :model, :condition, :price, :engine_volume, :fuel_type, :gear_box, presence: true
  validates :price, numericality: { greater_then: 0 }
  validates :year, numericality: { greater_then: Time.current.year }
  validates :odometer, numericality: { greater_then_or_equal_to: 0 }

  enum :condition, [:new_condition, :used]
  enum :gear_box, [:automatic, :manual, :variator]

  has_many_attached :images
  has_one_attached :video
end
