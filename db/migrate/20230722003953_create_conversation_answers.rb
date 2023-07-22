class CreateConversationAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :conversation_answers do |t|
      t.references :chat_option, null: false, foreign_key: true
      t.references :conversation, null: false, foreign_key: true
      t.text :answer

      t.timestamps
    end
  end
end
