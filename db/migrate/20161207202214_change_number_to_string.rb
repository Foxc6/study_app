class ChangeNumberToString < ActiveRecord::Migration
  def change
  	change_column :objectives, :number, :string
  end
end
