class WelcomeController < ApplicationController
	def index
		@projects = Project.all
		@subjects = Subject.children.all
		@parent_subjects = Subject.where(parent_id: nil).all
		@objectives = Objective.all
	end
end