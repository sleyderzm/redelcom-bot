module ChatbotValidation
  class ValidateDate < BaseValidation
    def self.valid?(message)
      Date.strptime(message, '%d-%m-%Y')
      true
    rescue ArgumentError
      false
    end
  end
end