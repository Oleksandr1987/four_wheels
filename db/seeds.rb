# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Create 10 users
10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    phone: Faker::PhoneNumber.phone_number,
    password_digest: BCrypt::Password.create('P@ssword123456')
  )
end

# Create 10 vehicles for each user
User.all.each do |user|
  10.times do
    Vehicle.create(
      region: Faker::Address.state,
      year: Faker::Vehicle.year,
      odometer: Faker::Vehicle.kilometrage,
      brand: Faker::Vehicle.manufacture,
      model: Faker::Vehicle.model,
      state: ['new', 'used'].sample,
      price: Faker::Commerce.price(range: 5000..50_000),
      engine_volume: Faker::Number.decimal(l_digits: 1, r_digits: 1),
      fuel_type: ['petrol', 'diesel', 'electric', 'hybrid'].sample,
      gear_box: ['automatic', 'manual', 'variator'].sample,
      drive_type: ['front-wheel drive', 'rear-wheel drive', 'all-wheel drive'].sample,
      color: Faker::Vehicle.color,
      vin_number: Faker::Vehicle.vin,
      image_url: Faker::Internet.url,
      description: Faker::Lorem.sentence(word_count: 15),
      is_available: [true, false].sample,
      body_type: Faker::Vehicle.car_type,
      type: ['Passanger cars', "Moto", "Trucks", "Trailers", "Special equipment", "Agricultural machinery", "Buses"].sample,  # or you can specify a different type if required
      user_id: user.id
    )
  end
end

puts "Seed data created!"
