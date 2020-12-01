class CreatePerformances < ActiveRecord::Migration[6.0]
  def change
    create_table :performances do |t|
      t.integer :customer_number
      t.date :date

      t.timestamps
    end
  end
end
