class Objective < ActiveRecord::Base
  belongs_to :subject
  belongs_to :objective_status
  belongs_to :project
  
  before_create :set_number
  before_save :set_subject

  def set_number
  	@objectives = Objective.all
    if @objectives.any?
      pre = Objective.order(:number).last
      pre_number = pre.number
      pre_int = pre_number.to_i
      new_int = sprintf '%04d', (pre_int+1)
      string = new_int.to_s
      self.number = string
    else
      self.number = (sprintf '%04d', 1).to_s
    end
  end

  def set_subject
    @misc_id = Subject.find_by(name: "Misc").id
    @subject_id = self.subject_id
    if @subject_id.blank?
      self.subject_id = @misc_id

    end
  end
end
