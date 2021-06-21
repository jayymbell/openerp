class PurchaseOrdersController < ApplicationController
  before_action :set_purchase_order, only: [:show, :edit, :update, :destroy, :duplicate]
  before_action :set_available_services, only: [:new, :edit, :update, :create]

  # GET /purchase_orders
  # GET /purchase_orders.json
  def index
    @purchase_orders = PurchaseOrder.all
  end

  # GET /purchase_orders/1
  # GET /purchase_orders/1.json
  def show
  end

  # GET /purchase_orders/new
  def new
    @purchase_order = PurchaseOrder.new
    @purchase_order.project = params[:project_id].present? ? Project.find(params[:project_id]) : nil
    set_available_customers
    set_available_employees
    set_available_jobs
    set_available_workflows
  end

  # GET /purchase_orders/1/edit
  def edit
    set_available_customers
    set_available_employees
    set_available_jobs
    set_available_workflows
  end

  # POST /purchase_orders
  # POST /purchase_orders.json
  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    respond_to do |format|
      set_file_uploads
      if @purchase_order.save
        flash_message(:success, "Purchase order successfully created.")
        format.html { redirect_to @purchase_order, notice: 'Purchase order was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_order }
        format.js {render js:'window.location.reload();'}
      else
        set_available_customers
        set_available_employees
        set_available_jobs
        set_available_workflows
        format.html { render :new }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
        format.js {render 'new'}
      end
    end
  end

  # PATCH/PUT /purchase_orders/1
  # PATCH/PUT /purchase_orders/1.json
  def update
    delete_purchase_order_services
    delete_purchase_order_efforts
    set_available_jobs
    respond_to do |format|
      if @purchase_order.update(purchase_order_params)
        flash_message(:success, "Purchase order successfully updated.")
        format.html { redirect_to @purchase_order, notice: 'Purchase order was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_order }
        format.js {render js:'window.location.reload();'}
      else
        set_available_customers
        set_available_employees
        set_available_workflows
        format.html { render :edit }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
        format.js {render 'edit'}
      end
    end
  end

  # DELETE /purchase_orders/1
  # DELETE /purchase_orders/1.json
  def destroy
    @purchase_order.destroy
    respond_to do |format|
      flash_message(:success, "Purchase order successfully deleted.")
      format.html { redirect_to purchase_orders_url, notice: 'Purchase order was successfully destroyed.' }
      format.json { head :no_content }
      format.js {render js:'window.location.reload();'}
    end
  end

  def duplicate
    @purchase_order_dup = @purchase_order.duplicate
    puts @purchase_order_dup.inspect
    respond_to do |format|
      set_file_uploads
      if @purchase_order_dup.save
        flash_message(:success, "Purchase order successfully duplicated.")
        format.html { redirect_to @purchase_order_dup, notice: 'Purchase order was successfully duplicated.' }
        format.json { render :show, status: :created, location: @purchase_order_dup }
        format.js {render js:'window.location.reload();'}
      else
        set_available_customers
        set_available_employees
        set_available_jobs
        format.html { render :new }
        format.json { render json: @purchase_order_dup.errors, status: :unprocessable_entity }
        format.js {render 'new'}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions. 
    def set_purchase_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchase_order_params
      if params[:purchase_order].has_key?(:purchase_order_services_attributes)
        params[:purchase_order][:purchase_order_services_attributes].each do |p|
          p[1][:tos_file] = p[1][:tos_file].read unless p[1][:tos_file].blank? || p[1][:tos_file].instance_of?(String)
        end
      end
      params.require(:purchase_order).permit(:customer_id, :project_id, :name, :workflow_id, :workflow_state_id, purchase_order_services_attributes: [:id, :service_id, :total, :tos_file, :tos_file_type, :tos_file_data], purchase_order_efforts_attributes: [:id, :employee_id, :total, :job_id, :hours])
    end

    def set_available_customers
      @available_customers = @purchase_order.project.present? ? @purchase_order.project.customers : nil
    end

    def set_available_services
      @availabe_services = Service.where(is_active: true)
    end

    def set_available_employees
      @available_employees = @purchase_order.project.present? ? @purchase_order.project.employees : nil
    end

    def set_available_jobs
      @available_jobs = @purchase_order.project.present? ? Job.where(is_active: true, id: EmployeeJob.where(employee_id:  @purchase_order.project.employees.pluck(:id)).pluck(:job_id)) : nil
    end

    def set_available_workflows
      @available_workflows = Workflow.where(category: 'purchase order')
    end

    def delete_purchase_order_services
      @purchase_order.purchase_order_services.each do |pos|
        remove_pos = true
        if purchase_order_params[:purchase_order_services_attributes].present?
          purchase_order_params[:purchase_order_services_attributes].each do |p|
            if p[1][:id].to_s == pos.id.to_s 
              remove_pos = false
            end
          end
          if remove_pos
            @purchase_order.purchase_order_services.delete(pos)
          end
        else
          @purchase_order.purchase_order_services.delete_all
        end
      end
    end

    def delete_purchase_order_efforts
      @purchase_order.purchase_order_efforts.each do |poe|
        remove_poe = true
        puts purchase_order_params.inspect
        if purchase_order_params[:purchase_order_efforts_attributes].present?
          purchase_order_params[:purchase_order_efforts_attributes].each do |p|
            if p[1][:id].to_s == poe.id.to_s 
              remove_poe = false
            end
          end
          if remove_poe
            @purchase_order.purchase_order_efforts.delete(poe)
          end
        else
          @purchase_order.purchase_order_efforts.destroy_all
        end
      end
    end

    def set_file_uploads
      
        
  end
end
