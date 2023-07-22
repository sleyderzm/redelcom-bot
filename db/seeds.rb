# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Customer.count.zero?
  Customer.create([
    {rut: '12345678', name: 'Sleyder Z S.A.S.', balance: Money.new(1_000_00, 'USD')},
    {rut: '87654321', name: 'REDELCOM', balance: Money.new(1_000_00, 'USD')}
  ])
end

if Product.count.zero?
  Product.create(name: 'Rollos de Papel', price: Money.new(700_00, 'USD'))
end

if ChatOption.count.zero?
  ChatOption.create(
    text: 'Consulta Indicadores Económicos',
    action: 'EconomicIndicators',
    validation: nil,
    next_option_id: nil,
    alias: 3
  )

  step3 = ChatOption.create(
    text: 'Cuantos rollos desea encargar?',
    action: 'CreatePurchase',
    validation: 'ValidateNumber',
    next_option_id: nil,
    attribute_name: 'number'
  )

  step2 = ChatOption.create(
    text: 'Direccion del envio?',
    action: nil,
    validation: 'ValidateAddress',
    next_option: step3,
    attribute_name: 'address'
  )

  step1 = ChatOption.create(
    text: 'Cúal es el RUT de tu compañia?',
    action: nil,
    validation: 'ValidateRut',
    next_option: step2,
    attribute_name: 'rut'
  )

  ChatOption.create(
    text: 'Realizar Solicitud Rollos de Papel',
    action: nil,
    validation: nil,
    next_option: step1,
    alias: 2
  )

  step2 = ChatOption.create(
    text: 'Cúal es la fecha de despacho? dd-mm-yyyy',
    action: 'GetDeposit',
    validation: 'ValidateDate',
    next_option: nil,
    attribute_name: 'date'
  )

  step1 = ChatOption.create(
    text: 'Cúal es el RUT de tu compañia?',
    action: nil,
    validation: 'ValidateRut',
    next_option: step2,
    attribute_name: 'rut'
  )

  ChatOption.create(
    text: 'Consulta de Depósito',
    action: nil,
    validation: nil,
    next_option: step1,
    alias: 1
  )

end