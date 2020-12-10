class ChangeCostToBeFloatInRecipes < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :cost, :float
  end
end
