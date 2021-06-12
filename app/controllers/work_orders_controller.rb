class WorkOrdersController < ApplicationController
  before_action :set_work_order, only: [:show, :edit, :update, :destroy, :duplicate]

  # GET /work_orders or /work_orders.json
  def index
    @work_orders = WorkOrder.all
  end

  # GET /work_orders/1 or /work_orders/1.json
  def show
  end

  # GET /work_orders/new
  def new
    @work_order = WorkOrder.new
    @work_order.project = Project.find(params[:project_id])
    set_available_employees
  end

  # GET /work_orders/1/edit
  def edit
    set_available_employees
  end

  # POST /work_orders or /work_orders.json
  def create
    @work_order = WorkOrder.new(work_order_params)

    respond_to do |format|
      if @work_order.save
        flash_message(:success, "Work order was successfully created.'")
        format.html { redirect_to @work_order, notice: "Work order was successfully created." }
        format.json { render :show, status: :created, location: @work_order }
        format.js {render js:'window.location.reload();'}
      else
        set_available_employees
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
        format.js {render 'new'}
      end
    end
  end

  # PATCH/PUT /work_orders/1 or /work_orders/1.json
  def update
    respond_to do |format|
      if @work_order.update(work_order_params)
        flash_message(:success, "Work order was successfully updated.'")
        format.html { redirect_to @work_order, notice: "Work order was successfully updated." }
        format.json { render :show, status: :ok, location: @work_order }
        format.js {render js:'window.location.reload();'}
      else
        set_available_employees
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
        format.js {render 'edit'}
      end
    end
  end

  # DELETE /work_orders/1 or /work_orders/1.json
  def destroy
    @work_order.destroy
    respond_to do |format|
      flash_message(:success, "Work order was successfully deleted.'")
      format.html { redirect_to work_orders_url, notice: "Work order was successfully destroyed." }
      format.json { head :no_content }
      format.js {render js:'window.location.reload();'}
    end
  end

  def duplicate
    @work_order_dup = @work_order.duplicate
    puts @work_order_dup.inspect
    respond_to do |format|
      if @work_order_dup.save
        flash_message(:success, "Work order successfully duplicated.")
        format.html { redirect_to @work_order_dup, notice: 'Work order was successfully duplicated.' }
        format.json { render :show, status: :created, location: @work_order_dup }
        format.js {render js:'window.location.reload();'}
      else
        format.html { render :new }
        format.json { render json: @work_order_dup.errors, status: :unprocessable_entity }
        format.js {render 'new'}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_order
      @work_order = WorkOrder.find(params[:id])
    end

    def set_available_employees
      @available_employees = @work_order.project.present? ? @work_order.project.employees : nil
    end


    # Only allow a list of trusted parameters through.
    def work_order_params
      params.require(:work_order).permit(:name, :description, :project_id, work_order_efforts_attributes: [:id, :employee_id, :hours, :short_description, :long_description, :completed_on])
    end
end
