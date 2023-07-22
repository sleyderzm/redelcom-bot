class ChatOption < ApplicationRecord
  belongs_to :next_option, class_name: 'ChatOption', optional: true

  ATTRIBUTES = {
    number: 'number',
    address: 'address',
    rut: 'rut',
    date: 'date',
  }
end
