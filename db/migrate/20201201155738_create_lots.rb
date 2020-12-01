class CreateLots < ActiveRecord::Migration[6.0]
  def change
    create_table :lots do |t|
      t.date :expiration_date
      t.integer :cost
      t.integer :quantity
      t.references :product, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
