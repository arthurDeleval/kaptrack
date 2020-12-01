class CreateSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :address
      t.integer :phone_number
      t.integer :delivery_estimation

      t.timestamps
    end
  end
end
