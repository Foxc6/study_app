class Subject < ActiveRecord::Base
	has_many :objectives

	belongs_to :parent, :class_name => 'Subject'
  	has_many :children, :class_name => 'Subject', :foreign_key => 'parent_id'

  	scope :children, -> { where("parent_id IS NOT NULL") }
end
