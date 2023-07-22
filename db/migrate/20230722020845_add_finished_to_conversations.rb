class AddFinishedToConversations < ActiveRecord::Migration[7.0]
  def change
    add_column :conversations, :finished, :boolean, default: false
  end
end
