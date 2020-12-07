class AddDateEndToPerformances < ActiveRecord::Migration[6.0]
  def change
    add_column :performances, :date_end, :date
  end
end
