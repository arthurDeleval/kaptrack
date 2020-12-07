class AddCostToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :cost, :integer
  end
end
