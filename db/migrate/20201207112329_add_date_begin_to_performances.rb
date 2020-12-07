class AddDateBeginToPerformances < ActiveRecord::Migration[6.0]
  def change
    add_column :performances, :date_begin, :date
  end
end
