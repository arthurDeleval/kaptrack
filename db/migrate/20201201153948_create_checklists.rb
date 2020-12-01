class CreateChecklists < ActiveRecord::Migration[6.0]
  def change
    create_table :checklists do |t|
      t.string :title
      t.string :description
      t.date :deadline
      t.integer :priority_level

      t.timestamps
    end
  end
end
