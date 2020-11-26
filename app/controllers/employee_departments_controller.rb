class EmployeeDepartmentsController < ApplicationController
  before_action :set_employee_department, only: [:show, :edit, :update, :destroy]

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
        format.html { redirect_to @employee_department, notice: 'Employee department was successfully created.' }
        format.json { render :show, status: :created, location: @employee_department }
      else
        format.html { render :new }
        format.json { render json: @employee_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_departments/1
  # PATCH/PUT /employee_departments/1.json
  def update
    respond_to do |format|
      if @employee_department.update(employee_department_params)
        format.html { redirect_to @employee_department, notice: 'Employee department was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_department }
      else
        format.html { render :edit }
        format.json { render json: @employee_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_departments/1
  # DELETE /employee_departments/1.json
  def destroy
    @employee_department.destroy
    respond_to do |format|
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
end
