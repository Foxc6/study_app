class RenameStatusIdInObjectives < ActiveRecord::Migration
  def change
   rename_column :objectives, :status_id, :objective_status_id
   rename_index :objectives, :index_objectives_on_status_id, :index_objectives_on_objective_status_id
  end
end
