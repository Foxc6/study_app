class RenameProjectStatusIdInProjects < ActiveRecord::Migration
  def change
   rename_column :projects, :project_status_id, :project_state_id
   rename_index :projects, :index_projects_on_project_status_id, :index_projects_on_project_state_id
  end
end
