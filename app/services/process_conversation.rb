class ProcessConversation

  VALIDATION_MODULE = "ChatbotValidation::"
  ACTION_MODULE = "ChatbotAction::"
  def self.perform(conversation, message)

    #current option is nil when is the first time
    if conversation.current_option.nil?
      return  "El valor seleccionado es invalido, Intenta de nuevo" unless is_valid_number?(message)
      selected_option = ChatOption.find_by(alias: message.to_i)
      if selected_option.nil?
        return  "El valor seleccionado es invalido, Intenta de nuevo"
      end

      conversation.update(current_option: selected_option)
    end

    current_option = conversation.current_option

    unless is_valid_input?(current_option, message, conversation)
      return  "El valor seleccionado es invalido, " +  current_option.text
    end

    conversation.conversation_answers.create(
      chat_option: current_option,
      answer: message
    )

    if current_option.action
      conversation.update(finished: true)
      return get_action_message(current_option, conversation)
    end

    conversation.update(current_option: current_option.next_option)
    conversation.current_option.text
  end

  private

  def self.is_valid_input?(option, message, conversation)
    return true unless option.validation
    "#{VALIDATION_MODULE}#{option.validation}".constantize.valid?(message, conversation)
  end
  def self.get_action_message(option, conversation)
    "#{ACTION_MODULE}#{option.action}".constantize.perform(conversation)
  end

  def self.is_valid_number?(str)
    Integer(str)
    true
  rescue ArgumentError
    false
  end

end