module ChatbotAction
  class GetDeposit < BaseAction
    def self.perform(conversation)
      rut = get_answer(conversation, ChatOption::ATTRIBUTES[:rut])
      return error_message if rut.nil? || rut.blank?

      customer = Customer.find_by(rut: rut)
      return  error_message unless customer

      purchase_date_s = get_answer(conversation, ChatOption::ATTRIBUTES[:date])
      return error_message if purchase_date_s.nil? || purchase_date_s.blank?

      purchase_date = Date.strptime(purchase_date_s, '%d-%m-%Y')

      deposit = Money.new(0, 'USD')
      Purchase.where(customer: customer, purchase_date: purchase_date).each do |purchase|
        deposit += purchase.total
      end

      "para este dia tienes pendiente un deposito de #{deposit.currency.iso_code} #{deposit.to_s}"
    end
  end
end