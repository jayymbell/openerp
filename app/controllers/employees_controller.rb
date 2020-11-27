class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :set_available_supervisors, only: [:new, :create, :edit, :update]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @employee.is_active = true
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        flash_message(:success, "Employee successfully created.")
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
        format.js {render js:'window.location.reload();'}
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
        format.js {render 'new'}
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        flash_message(:success, "Employee successfully updated.")
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
        format.js {render js:'window.location.reload();'}
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
        format.js {render 'edit'}
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      flash_message(:success, "Employee successfully deleted.")
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
      format.js {render js:'window.location.reload();'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:person_id, :is_active, :supervisor_id)
    end

    def set_available_supervisors
      @available_supervisors = @emplid.present? ? Employee.where.not(id:@employee.id) : Employee.all
    end
end
