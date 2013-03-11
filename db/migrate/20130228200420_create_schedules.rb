class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :year
      t.string :month
      t.string :week
      t.string :status
      t.integer :assigned_project_id

      t.timestamps
    end
  end
end
