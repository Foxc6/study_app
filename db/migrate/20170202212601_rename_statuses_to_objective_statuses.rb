class RenameStatusesToObjectiveStatuses < ActiveRecord::Migration
  def change
    rename_table :statuses, :objective_statuses
  end
end
