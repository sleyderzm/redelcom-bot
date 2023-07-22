module ChatbotValidation
  class ValidateRut < BaseValidation
    def self.valid?(message)
      Customer.exists?(rut: message)
    end
  end
end