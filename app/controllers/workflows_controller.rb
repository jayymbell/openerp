class WorkflowsController < ApplicationController
  before_action :set_workflow, only: [:show, :edit, :update, :destroy, :duplicate]

  # GET /workflows
  # GET /workflows.json
  def index
    @workflows = Workflow.all
  end

  # GET /workflows/1
  # GET /workflows/1.json
  def show
  end

  # GET /workflows/new
  def new
    @workflow = Workflow.new
    @workflow.is_active = true
  end

  # GET /workflows/1/edit
  def edit
  end

  # POST /workflows
  # POST /workflows.json
  def create
    @workflow = Workflow.new(workflow_params)

    respond_to do |format|
      if @workflow.save
        flash_message(:success, "Workflow successfully created.")
        format.html { redirect_to @workflow, notice: 'Workflow was successfully created.' }
        format.json { render :show, status: :created, location: @workflow }
        format.js {render js:'window.location.reload();'}
      else
        format.html { render :new }
        format.json { render json: @workflow.errors, status: :unprocessable_entity }
        format.js {render 'new'}
      end
    end
  end

  # PATCH/PUT /workflows/1
  # PATCH/PUT /workflows/1.json
  def update
    respond_to do |format|
      if @workflow.update(workflow_params)
        flash_message(:success, "Workflow successfully updated.")
        format.html { redirect_to @workflow, notice: 'Workflow was successfully updated.' }
        format.json { render :show, status: :ok, location: @workflow }
        format.js {render js:'window.location.reload();'}
      else
        format.html { render :edit }
        format.json { render json: @workflow.errors, status: :unprocessable_entity }
        format.js {render 'edit'}
      end
    end
  end

  # DELETE /workflows/1
  # DELETE /workflows/1.json
  def destroy
    @workflow.destroy
    respond_to do |format|
      flash_message(:success, "Workflow successfully deleted.")
      format.html { redirect_to workflows_url, notice: 'Workflow was successfully destroyed.' }
      format.json { head :no_content }
      format.js {render js:'window.location.reload();'}
    end
  end

  def duplicate
    @workflow_dup = @workflow.duplicate
    respond_to do |format|
      if @workflow_dup.save
        flash_message(:success, "Purchase order successfully duplicated.")
        format.html { redirect_to @workflow_dup, notice: 'Purchase order was successfully duplicated.' }
        format.json { render :show, status: :created, location: @workflow_dup }
        format.js {render js:'window.location.reload();'}
      else
        format.html { render :new }
        format.json { render json: @workflow_dup.errors, status: :unprocessable_entity }
        format.js {render 'new'}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workflow
      @workflow = Workflow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def workflow_params
      params.require(:workflow).permit(:name, :description, :category, :is_active)
    end
end
