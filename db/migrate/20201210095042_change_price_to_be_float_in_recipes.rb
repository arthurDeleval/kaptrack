class ChangePriceToBeFloatInRecipes < ActiveRecord::Migration[6.0]
  def change
      change_column :recipes, :price, :float
  end
end
