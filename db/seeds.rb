# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

factory = Factory.create!(
  name: "Car Factory"
)

["Basic structure", "Electronic devices", "Painting and final details"].each_with_index do |assembly_name, index|
  AssemblyLine.create!(
    name: assembly_name,
    assembly_order: index + 1,
    factory: factory
  )
end

10.times do |index|
  Model.create!(
    name: Faker::Name.unique.name,
    cost_price: Faker::Number.between(from: 100, to: 1000),
    price: Faker::Number.between(from: 1000, to: 1500),
    year: Faker::Number.between(from: 2000, to: 2020)
  )
end