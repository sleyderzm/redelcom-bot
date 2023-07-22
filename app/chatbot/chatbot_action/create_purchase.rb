module ChatbotAction
  class CreatePurchase < BaseAction
    def self.perform(conversation)
      rut = get_answer(conversation, ChatOption::ATTRIBUTES[:rut])
      return error_message if rut.nil? || rut.blank?

      customer = Customer.find_by(rut: rut)
      return  error_message unless customer

      address = get_answer(conversation, ChatOption::ATTRIBUTES[:address])
      return error_message if address.nil? || address.blank?

      quantity_to_purchase = get_answer(conversation, ChatOption::ATTRIBUTES[:number])
      return error_message if address.nil? || address.blank?

      product = Product.where(name: 'Rollos de Papel').first
      purchase_date = Date.current + 1.day

      current_purchase_total = product.price * quantity_to_purchase.to_i

      previous_purchases = Purchase.where(customer: customer, purchase_date: purchase_date)

      available_balance = customer.balance
      previous_purchases.each do |previous_purchase|
        available_balance -= previous_purchase.total
      end

      return "Fondos insuficientes para comprar, intenta otro dia :(" if (available_balance - current_purchase_total).negative?

      Purchase.create(
        customer: customer,
        address: address,
        product: product,
        quantity: quantity_to_purchase,
        purchase_date: purchase_date,
        total: current_purchase_total
      )

      "Tu compra ha tenido un precio de #{current_purchase_total.currency.iso_code} #{current_purchase_total.to_s}"
    end
  end
end