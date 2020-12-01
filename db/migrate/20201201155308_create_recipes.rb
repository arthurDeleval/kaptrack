class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :recipe_description
      t.integer :price
      t.integer :preparation_time
      t.string :specificity
      t.string :meal_description
      t.boolean :menu_visible, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
