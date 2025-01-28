class CreateVehicles < ActiveRecord::Migration[7.2]
  def change
    create_table :vehicles do |t|
      t.string :region
      t.integer :year
      t.integer :odometer
      t.string :brand
      t.string :model
      t.string :state
      t.decimal :price
      t.decimal :engine_volume
      t.string :fuel_type
      t.string :gear_box
      t.string :drive_type
      t.string :color
      t.string :vin_number
      t.string :image_url
      t.text :description
      t.boolean :is_available
      t.string :body_type
      t.string :type

      t.timestamps
    end
  end
end
