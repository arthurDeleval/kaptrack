class AddDateToPerformances < ActiveRecord::Migration[6.0]
  def change
    add_column :performances, :date, :date
  end
end
