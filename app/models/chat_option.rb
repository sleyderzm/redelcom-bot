class ChatOption < ApplicationRecord
  belongs_to :next_option, class_name: 'ChatOption', optional: true
end
