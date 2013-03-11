class CreateAsignedProjects < ActiveRecord::Migration
  def change
    create_table :asigned_projects do |t|
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
