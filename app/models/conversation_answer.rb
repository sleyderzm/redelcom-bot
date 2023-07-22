class ConversationAnswer < ApplicationRecord
  belongs_to :chat_option
  belongs_to :conversation
end
