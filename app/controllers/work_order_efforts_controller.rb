class WorkOrderEffortsController < ApplicationController
  before_action :set_work_order_effort, only: %i[ show edit update destroy ]

  # GET /work_order_efforts or /work_order_efforts.json
  def index
    @work_order_efforts = WorkOrderEffort.all
  end

  # GET /work_order_efforts/1 or /work_order_efforts/1.json
  def show
  end

  # GET /work_order_efforts/new
  def new
    @work_order_effort = WorkOrderEffort.new
  end

  # GET /work_order_efforts/1/edit
  def edit
  end

  # POST /work_order_efforts or /work_order_efforts.json
  def create
    @work_order_effort = WorkOrderEffort.new(work_order_effort_params)

    respond_to do |format|
      if @work_order_effort.save
        format.html { redirect_to @work_order_effort, notice: "Work order effort was successfully created." }
        format.json { render :show, status: :created, location: @work_order_effort }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @work_order_effort.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_order_efforts/1 or /work_order_efforts/1.json
  def update
    respond_to do |format|
      if @work_order_effort.update(work_order_effort_params)
        format.html { redirect_to @work_order_effort, notice: "Work order effort was successfully updated." }
        format.json { render :show, status: :ok, location: @work_order_effort }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @work_order_effort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_order_efforts/1 or /work_order_efforts/1.json
  def destroy
    @work_order_effort.destroy
    respond_to do |format|
      format.html { redirect_to work_order_efforts_url, notice: "Work order effort was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_order_effort
      @work_order_effort = WorkOrderEffort.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_order_effort_params
      params.require(:work_order_effort).permit(:work_order_id, :short_description, :long_description, :employee_id, :hours, :completed_on)
    end
end
