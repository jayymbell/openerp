class ProjectEmployeesController < ApplicationController
  before_action :set_project_employee, only: [:show, :edit, :update, :destroy]
  before_action :set_available_employees, only: [:new, :create, :edit, :update]
  before_action :set_available_projects, only: [:new, :create, :edit, :update]

  # GET /project_employees
  # GET /project_employees.json
  def index
    @project_employees = ProjectEmployee.all
  end

  # GET /project_employees/1
  # GET /project_employees/1.json
  def show
  end

  # GET /project_employees/new
  def new
    @project_employee = ProjectEmployee.new
    @project_employee.is_active = true
    @project_employee.employee = params[:employee_id].present? ? Employee.find(params[:employee_id]) : nil
    @project_employee.project = params[:project_id].present? ? Project.find(params[:project_id]) : nil
  end

  # GET /project_employees/1/edit
  def edit
  end

  # POST /project_employees
  # POST /project_employees.json
  def create
    @project_employee = ProjectEmployee.new(project_employee_params)

    respond_to do |format|
      if @project_employee.save
        flash_message(:success, "Project employee successfully created.")
        format.html { redirect_to @project_employee, notice: 'Project employee was successfully created.' }
        format.json { render :show, status: :created, location: @project_employee }
        format.js {render js:'window.location.reload();'}
      else
        format.html { render :new }
        format.json { render json: @project_employee.errors, status: :unprocessable_entity }
        format.js {render 'new'}
      end
    end
  end

  # PATCH/PUT /project_employees/1
  # PATCH/PUT /project_employees/1.json
  def update
    respond_to do |format|
      if @project_employee.update(project_employee_params)
        flash_message(:success, "Project employee successfully updated.")
        format.html { redirect_to @project_employee, notice: 'Project employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_employee }
        format.js {render js:'window.location.reload();'}
      else
        format.html { render :edit }
        format.json { render json: @project_employee.errors, status: :unprocessable_entity }
        format.js {render 'edit'}
      end
    end
  end

  # DELETE /project_employees/1
  # DELETE /project_employees/1.json
  def destroy
    @project_employee.destroy
    respond_to do |format|
      flash_message(:success, "Project employee successfully deleted.")
      format.html { redirect_to project_employees_url, notice: 'Project employee was successfully destroyed.' }
      format.json { head :no_content }
      format.js {render js:'window.location.reload();'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_employee
      @project_employee = ProjectEmployee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_employee_params
      params.require(:project_employee).permit(:project_id, :employee_id, :is_active)
    end
    def set_available_employees
      @available_employees= params[:employee_id].present? ? Employee.where(id: params[:employee_id]) : Employee.all
    end
    def set_available_projects
      @available_projects = params[:project_id].present? ? Project.where(id: params[:project_id]) : Project.all
    end
end
