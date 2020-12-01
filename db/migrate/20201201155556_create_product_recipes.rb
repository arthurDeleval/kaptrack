class CreateProductRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :product_recipes do |t|
      t.integer :recipe_quantity
      t.references :recipe, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
