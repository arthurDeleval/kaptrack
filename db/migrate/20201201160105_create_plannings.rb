class CreatePlannings < ActiveRecord::Migration[6.0]
  def change
    create_table :plannings do |t|
      t.time :starting_shift
      t.time :ending_shift
      t.date :starting_date
      t.date :ending_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
