class ChatbotController < ApplicationController
  include ChatbotHelper
  def index
    #TODO: descomentar
    ##@conversation = Conversation.create
    @conversation = Conversation.find(6)
    @main_options = ChatOption.where.not(alias: nil).order(:alias)
  end
  def render_user_message
    user_message = params[:message]
    render turbo_stream: turbo_stream.append('messages', partial: 'user_message', locals: { user_message: user_message })
  end
  def render_bot_response
    user_message = params[:message]

    #get current conversation
    conversation = Conversation.find(params[:conversation_id])
    if conversation.nil? || conversation.finished
      return_error_message
      return
    end

    message = ProcessConversation.perform(conversation, user_message)
    render_bot_message(message)
  end
end
