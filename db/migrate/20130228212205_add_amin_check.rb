class AddAminCheck < ActiveRecord::Migration
  def up
  	add_column :man_days, :check, :boolean
  end

  def down
  	remove_column :man_days, :check 
  end
end
