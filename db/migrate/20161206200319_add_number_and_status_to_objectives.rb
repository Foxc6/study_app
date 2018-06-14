class AddNumberAndStatusToObjectives < ActiveRecord::Migration
  def change
    add_column :objectives, :number, :integer
    add_reference :objectives, :status, index: true
  end
end
