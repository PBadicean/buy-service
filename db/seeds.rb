# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  email: "admin_buy_service@gmail.com",
  admin: true,
  name: 'Admin',
  password: 'admin123',
  password_confirmation: 'admin123'
)

User.create(
  email: "user@gmail.com",
  admin: false,
  name: 'User buy_service',
  password: 'user123',
  password_confirmation: 'user123'
)

Category.create(name: "musical instruments")
Category.create(name: "clothes")
Category.create(name: "technique")
Category.create(name: "books")
