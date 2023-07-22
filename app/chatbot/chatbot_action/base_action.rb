module ChatbotAction
  class BaseAction
    def self.perform(conversation)
      "Tu conversacion ha terminado, fue un placer atenderte :)"
    end

    private
    def error_message
      "Su solicitud no pudo ser procesada, intentalo de nuevo mas tarde"
    end

    def get_answer(conversation, attribute_name)
      conversation.conversation_answers.where(attribute_name: attribute_name).first&.answer
    end
  end
end