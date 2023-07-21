class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :address
      t.date :delivery_date

      t.timestamps
    end
  end
end
