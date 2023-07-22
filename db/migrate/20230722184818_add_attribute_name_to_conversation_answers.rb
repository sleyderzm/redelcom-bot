class AddAttributeNameToConversationAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :conversation_answers, :attribute_name, :string
  end
end
