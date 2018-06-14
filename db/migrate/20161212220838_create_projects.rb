class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :number
      t.references :project_status, index: true
      t.references :project_type, index: true
      t.datetime :start_date
      t.datetime :end_date
      t.text :notes

      t.timestamps null: false
    end
  end
end
