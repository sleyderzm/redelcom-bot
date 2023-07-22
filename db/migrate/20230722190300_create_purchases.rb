class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :address
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.date :purchase_date
      t.monetize :total

      t.timestamps
    end
  end
end
