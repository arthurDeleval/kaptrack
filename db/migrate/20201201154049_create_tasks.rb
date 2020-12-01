class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :validation, default: false
      t.references :checklist, foreign_key: true
      t.timestamps
    end
  end
end
