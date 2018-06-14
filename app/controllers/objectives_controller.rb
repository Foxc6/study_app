class ObjectivesController < ApplicationController
  before_action :set_objective, only: [:show, :edit, :update, :destroy]

  # GET /objectives
  # GET /objectives.json
  def index
    @objectives = Objective.all

    @active_id = ObjectiveStatus.find_by(name: "Active").id
    @hold_id = ObjectiveStatus.find_by(name: "On Hold").id
    @complete_id = ObjectiveStatus.find_by(name: "Complete").id
    @active_objectives = @objectives.where(objective_status_id: @active_id)
    @hold_objectives = @objectives.where(objective_status_id: @hold_id)
    @complete_objectives = @objectives.where(objective_status_id: @complete_id)
  end

  # GET /objectives/1
  # GET /objectives/1.json
  def show
    @project = @objective.project
  end

  # GET /objectives/new
  def new
    @objective = Objective.new
    @subjects = Subject.all
    @statuses = ObjectiveStatus.all
    @projects = Project.all
  end

  # GET /objectives/1/edit
  def edit
    @subjects = Subject.all
    @subject = @objective.subject
    @statuses = ObjectiveStatus.all
    @status = @objective.objective_status
    @projects = Project.all
    @project = @objective.project
  end

  # POST /objectives
  # POST /objectives.json
  def create
    @objective = Objective.new(objective_params)

    respond_to do |format|
      if @objective.save
        format.html { redirect_to @objective, notice: 'Objective was successfully created.' }
        format.json { render :show, status: :created, location: @objective }
      else
        format.html { render :new }
        format.json { render json: @objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /objectives/1
  # PATCH/PUT /objectives/1.json
  def update
    respond_to do |format|
      if @objective.update(objective_params)
        format.html { redirect_to @objective, notice: 'Objective was successfully updated.' }
        format.json { render :show, status: :ok, location: @objective }
      else
        format.html { render :edit }
        format.json { render json: @objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objectives/1
  # DELETE /objectives/1.json
  def destroy
    @objective.destroy
    respond_to do |format|
      format.html { redirect_to objectives_url, notice: 'Objective was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def load_lists
      @subjects = Subject.all
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_objective
      @objective = Objective.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def objective_params
      params.require(:objective).permit(:description, :notes, :parent_id, :position, :subject_id)
    end

    def objective_params
      params.require(:objective).permit(
          :id,
          :description,
          :notes,
          :parent_id,
          :position,
          :subject_id,
          :created_at,
          :updated_at,
          :number,
          :objective_status_id,
          :project_id
      )
    end
end
