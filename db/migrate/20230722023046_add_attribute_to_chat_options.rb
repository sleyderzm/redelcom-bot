class AddAttributeToChatOptions < ActiveRecord::Migration[7.0]
  def change
    add_column :chat_options, :attribute_name, :string
  end
end
