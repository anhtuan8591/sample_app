class CreateManDays < ActiveRecord::Migration
  def change
    create_table :man_days do |t|
      t.string :plan_man_day
      t.string :day_start
      t.string :end_time
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
