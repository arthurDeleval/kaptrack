class RemoveDateEndFromPerformances < ActiveRecord::Migration[6.0]
  def change
    remove_column :performances, :date_end, :date
  end
end
