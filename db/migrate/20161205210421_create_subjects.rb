class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :slug
      t.integer :parent_id

      t.timestamps null: false
    end
  end
end
