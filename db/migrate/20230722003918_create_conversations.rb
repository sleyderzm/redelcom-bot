class CreateConversations < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations do |t|
      t.references :current_option, foreign_key: { to_table: :chat_options }, optional: true
      t.references :customer, optional: true, foreign_key: true

      t.timestamps
    end
  end
end
