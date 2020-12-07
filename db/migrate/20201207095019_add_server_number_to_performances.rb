class AddServerNumberToPerformances < ActiveRecord::Migration[6.0]
  def change
    add_column :performances, :server_number, :integer
  end
end
