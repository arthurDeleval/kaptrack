class AddColumnToProductRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :product_recipes, :unit, :string
  end
end
