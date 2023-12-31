class Conversation < ApplicationRecord
  belongs_to :current_option, class_name: 'ChatOption', optional: true
  belongs_to :customer, optional: true
  has_many :conversation_answers
end
