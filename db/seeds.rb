# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Role.create(name: "admin")
Person.create(
  username: "admin",
  password: "admin",
  name: "admin",
  middle_name: "admin",
  last_name: "admin",
  second_last_name: "admin",
  address: "admin",
  phone: 1111,
  email: "admin@admin.com",
  status: true,
  role_id: 1)
