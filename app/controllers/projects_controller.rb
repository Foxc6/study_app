class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    @pending_id = ProjectState.find_by(name: "Pending").id
    @active_id = ProjectState.find_by(name: "Active").id
    @complete_id = ProjectState.find_by(name: "Complete").id
    @on_hold_id = ProjectState.find_by(name: "On Hold").id

    @pending_projects = @projects.where(project_state_id: @pending_id)
    @active_projects = @projects.where(project_state_id: @active_id)
    @complete_projects = @projects.where(project_state_id: @active_id)
    @on_hold_projects = @projects.where(project_state_id: @active_id)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @hold_id = ObjectiveStatus.find_by(name: "On Hold").id
    @complete_id = ObjectiveStatus.find_by(name: "Complete").id
    @objectives = @project.objectives.where.not(objective_status_id: @hold_id).where.not(objective_status_id: @complete_id)
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project_states = ProjectState.all
  end

  # GET /projects/1/edit
  def edit
    @project_states = ProjectState.all
    @project_state = @project.project_state
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(
          :id,
          :name,
          :number,
          :project_state_id,
          :start_date,
          :end_date,
          :notes,
          :created_at,
          :updated_at,
          :description,
          objectives_attributes: [:id, :description, :notes, :parent_id, :position, :subject_id, :created_at, :updated_at, :number, :objective_status_id, :project_id, :_destroy]
      )
    end
end
