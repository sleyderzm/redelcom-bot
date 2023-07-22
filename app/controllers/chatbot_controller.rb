class ChatbotController < ApplicationController

  def index
    ##@conversation = Conversation.create
    @conversation = Conversation.find(6)
    @main_options = ChatOption.where.not(alias: nil).order(:alias)
  end
  def received_user_message
    @message = params[:message]
    render turbo_stream: turbo_stream.append('messages', partial: 'user_message', locals: { message: @message })
  end
end
