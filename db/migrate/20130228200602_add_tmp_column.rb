class AddTmpColumn < ActiveRecord::Migration
  def up
  	add_column :schedules, :tmp, :boolean
  end

  def down
  	remove_column :schedules, :tmp
  end
end
