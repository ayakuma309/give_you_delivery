# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"

CSV.foreach('db/csv_data/item.csv', headers: true) do |row|
  Item.create(
    name: row['name'],
    image: row['image']
  )
end

User.create!(name:  "admin",
  email: "admin@admin.com",
  password:  "adminpassword",
  password_confirmation: "adminpassword",
  role: 1)
