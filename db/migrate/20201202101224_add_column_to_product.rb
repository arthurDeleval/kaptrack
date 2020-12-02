class AddColumnToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :measure_unit, :string
  end
end
