class CreateCustomerConsumptions < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_consumptions do |t|
      t.integer :quantity
      t.references :recipe, null: false, foreign_key: true
      t.references :performance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
