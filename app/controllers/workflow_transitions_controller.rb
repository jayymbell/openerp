class WorkflowTransitionsController < ApplicationController
  before_action :set_workflow_transition, only: [:show, :edit, :update, :destroy]

  # GET /workflow_transitions
  # GET /workflow_transitions.json
  def index
    @workflow_transitions = WorkflowTransition.all
  end

  # GET /workflow_transitions/1
  # GET /workflow_transitions/1.json
  def show
  end

  # GET /workflow_transitions/new
  def new
    @workflow_transition = WorkflowTransition.new
    @workflow_transition.workflow = params[:workflow_id].present? ? Workflow.find(params[:workflow_id]) : nil
    set_available_states
  end

  # GET /workflow_transitions/1/edit
  def edit
    set_available_states
  end

  # POST /workflow_transitions
  # POST /workflow_transitions.json
  def create
    @workflow_transition = WorkflowTransition.new(workflow_transition_params)

    respond_to do |format|
      if @workflow_transition.save
        flash_message(:success, "Workflow transition was successfully created.")
        format.html { redirect_to @workflow_transition, notice: 'Workflow transition was successfully created.' }
        format.json { render :show, status: :created, location: @workflow_transition }
        format.js {render js:'window.location.reload();'}
      else
        set_available_states
        format.html { render :new }
        format.json { render json: @workflow_transition.errors, status: :unprocessable_entity }
        format.js {render 'new'}
      end
    end
  end

  # PATCH/PUT /workflow_transitions/1
  # PATCH/PUT /workflow_transitions/1.json
  def update
    respond_to do |format|
      if @workflow_transition.update(workflow_transition_params)
        flash_message(:success, "Workflow transition was successfully updated.")
        format.html { redirect_to @workflow_transition, notice: 'Workflow transition was successfully updated.' }
        format.json { render :show, status: :ok, location: @workflow_transition }
        format.js {render js:'window.location.reload();'}
      else
        set_available_states
        format.html { render :edit }
        format.json { render json: @workflow_transition.errors, status: :unprocessable_entity }
        format.js {render 'edit'}
      end
    end
  end

  # DELETE /workflow_transitions/1
  # DELETE /workflow_transitions/1.json
  def destroy
    @workflow_transition.destroy
    respond_to do |format|
      flash_message(:success, "Workflow transition was successfully deleted.")
      format.html { redirect_to workflow_transitions_url, notice: 'Workflow transition was successfully destroyed.' }
      format.json { head :no_content }
      format.js {render js:'window.location.reload();'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workflow_transition
      @workflow_transition = WorkflowTransition.find(params[:id])
    end

    def set_available_states
    @available_workflow_states = WorkflowState.where(workflow_id: @workflow_transition.workflow_id)
    end

    # Only allow a list of trusted parameters through.
    def workflow_transition_params
      params.require(:workflow_transition).permit(:workflow_id, :name, :description, :source_state_id, :target_state_id, role_ids:[])
    end
end
