class ChatbotController < ApplicationController

  def index

  end
  def received_user_message
    @message = params[:message]
    render turbo_stream: turbo_stream.append('messages', partial: 'user_message', locals: { message: @message })
  end
end
