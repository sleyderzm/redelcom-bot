class CreateChatOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_options do |t|
      t.string :text
      t.integer :alias
      t.references :next_option, foreign_key: { to_table: :chat_options }, optional: true
      t.string :action
      t.string :validation

      t.timestamps
    end
  end
end
