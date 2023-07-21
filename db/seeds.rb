# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Customer.count.zero?
  Customer.create(rut: '12345678', name: 'Sleyder Z S.A.S.', balance: Money.new(1_000_00, 'USD'))
  Customer.create(rut: '87654321', name: 'REDELCOM', balance: Money.new(1_000_00, 'USD'))
end

if Product.count.zero?
  Product.create(name: 'Rollos de Papel', price: Money.new(700_00, 'USD'))
end