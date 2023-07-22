module ChatbotHelper
  def render_bot_message(message)
    render turbo_stream: turbo_stream.append('messages', partial: 'bot_message', locals: { bot_message: message })
  end

  def return_error_message
    render_bot_message("Esta conversación ha terminado, fue un placer ayudarte ;)")
  end
end
