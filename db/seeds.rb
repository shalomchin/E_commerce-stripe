# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'
1000.times do
  Product.create(name: FFaker::Name.female_name_with_prefix,
  description: FFaker::HipsterIpsum.paragraphs.join("\r\n",),
  price: rand(10.0...1000.0).round(2),
  stock: rand(1..10))

 end