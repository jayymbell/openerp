class EmployeeDepartmentsController < ApplicationController
  before_action :set_employee_department, only: [:show, :edit, :update, :destroy]
  before_action :set_available_employees, only: [:new, :create, :edit, :update]
  before_action :set_available_departments, only: [:new, :create, :edit, :update]

  # GET /employee_departments
  # GET /employee_departments.json
  def index
    @employee_departments = EmployeeDepartment.all
  end

  # GET /employee_departments/1
  # GET /employee_departments/1.json
  def show
  end

  # GET /employee_departments/new
  def new
    @employee_department = EmployeeDepartment.new
    @employee_department.is_active = true
    @employee_department.employee = params[:employee_id].present? ? Employee.find(params[:employee_id]) : nil
    @employee_department.department = params[:department_id].present? ? Department.find(params[:department_id]) : nil

    
  end

  # GET /employee_departments/1/edit
  def edit
  end

  # POST /employee_departments
  # POST /employee_departments.json
  def create
    @employee_department = EmployeeDepartment.new(employee_department_params)

    respond_to do |format|
      if @employee_department.save
        flash_message(:success, "Employee department successfully created.")
        format.html { redirect_to @employee_department, notice: 'Employee department was successfully created.' }
        format.json { render :show, status: :created, location: @employee_department }
        format.js {render js:'window.location.reload();'}
      else
        format.html { render :new }
        format.json { render json: @employee_department.errors, status: :unprocessable_entity }
        format.js {render 'new'}
      end
    end
  end

  # PATCH/PUT /employee_departments/1
  # PATCH/PUT /employee_departments/1.json
  def update
    respond_to do |format|
      if @employee_department.update(employee_department_params)
        flash_message(:success, "Employee department successfully updated.")
        format.html { redirect_to @employee_department, notice: 'Employee department was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_department }
        format.js {render js:'window.location.reload();'}
      else
        format.html { render :edit }
        format.json { render json: @employee_department.errors, status: :unprocessable_entity }
        format.js {render 'edit'}
      end
    end
  end

  # DELETE /employee_departments/1
  # DELETE /employee_departments/1.json
  def destroy
    @employee_department.destroy
    respond_to do |format|
      flash_message(:success, "Employee department successfully deleted.")
      format.html { redirect_to employee_departments_url, notice: 'Employee department was successfully destroyed.' }
      format.json { head :no_content }
      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_department
      @employee_department = EmployeeDepartment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_department_params
      params.require(:employee_department).permit(:employee_id, :department_id, :is_active)
    end

    def set_available_employees
      @available_employees = params[:employee_id].present? ? Employee.where(id: params[:employee_id]) : Employee.all
    end
    def set_available_departments
      @available_departments = params[:department_id].present? ? Department.where(id: params[:department_id]) : Department.all
    end
end
