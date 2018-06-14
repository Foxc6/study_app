class CreateObjectives < ActiveRecord::Migration
  def change
    create_table :objectives do |t|
      t.string :description
      t.text :notes
      t.integer :parent_id
      t.integer :position
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
