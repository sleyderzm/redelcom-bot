module ChatbotValidation
  class ValidateNumber < BaseValidation
    def self.valid?(message)
      Integer(message)
      true
    rescue ArgumentError
      false
    end

  end
end