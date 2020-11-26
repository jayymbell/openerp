class ServiceEmployeesController < ApplicationController
  before_action :set_service_employee, only: [:show, :edit, :update, :destroy]

  # GET /service_employees
  # GET /service_employees.json
  def index
    @service_employees = ServiceEmployee.all
  end

  # GET /service_employees/1
  # GET /service_employees/1.json
  def show
  end

  # GET /service_employees/new
  def new
    @service_employee = ServiceEmployee.new
  end

  # GET /service_employees/1/edit
  def edit
  end

  # POST /service_employees
  # POST /service_employees.json
  def create
    @service_employee = ServiceEmployee.new(service_employee_params)

    respond_to do |format|
      if @service_employee.save
        format.html { redirect_to @service_employee, notice: 'Service employee was successfully created.' }
        format.json { render :show, status: :created, location: @service_employee }
      else
        format.html { render :new }
        format.json { render json: @service_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_employees/1
  # PATCH/PUT /service_employees/1.json
  def update
    respond_to do |format|
      if @service_employee.update(service_employee_params)
        format.html { redirect_to @service_employee, notice: 'Service employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_employee }
      else
        format.html { render :edit }
        format.json { render json: @service_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_employees/1
  # DELETE /service_employees/1.json
  def destroy
    @service_employee.destroy
    respond_to do |format|
      format.html { redirect_to service_employees_url, notice: 'Service employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_employee
      @service_employee = ServiceEmployee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_employee_params
      params.require(:service_employee).permit(:employee_id, :service_id, :is_active, :is_primary)
    end
end
