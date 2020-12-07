class RemoveDateBeginFromPerformances < ActiveRecord::Migration[6.0]
  def change
    remove_column :performances, :date_begin, :date
  end
end
