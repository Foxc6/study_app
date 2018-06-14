class Project < ActiveRecord::Base
  belongs_to :project_state
  belongs_to :project_type

  has_many :objectives

  before_create :set_number

  def set_number
  	@projects = Project.all
    if @projects.any?
      pre = Project.order(:number).last
      pre_number = pre.number
      pre_int = pre_number.to_i
      new_int = sprintf '%04d', (pre_int+1)
      string = new_int.to_s
      self.number = string
    else
      self.number = (sprintf '%04d', 1).to_s
    end
  end
end
