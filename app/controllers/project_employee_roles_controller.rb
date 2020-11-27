class ProjectEmployeeRolesController < ApplicationController
  before_action :set_project_employee_role, only: [:show, :edit, :update, :destroy]

  # GET /project_employee_roles
  # GET /project_employee_roles.json
  def index
    @project_employee_roles = ProjectEmployeeRole.all
  end

  # GET /project_employee_roles/1
  # GET /project_employee_roles/1.json
  def show
  end

  # GET /project_employee_roles/new
  def new
    @project_employee_role = ProjectEmployeeRole.new
  end

  # GET /project_employee_roles/1/edit
  def edit
  end

  # POST /project_employee_roles
  # POST /project_employee_roles.json
  def create
    @project_employee_role = ProjectEmployeeRole.new(project_employee_role_params)

    respond_to do |format|
      if @project_employee_role.save
        format.html { redirect_to @project_employee_role, notice: 'Project employee role was successfully created.' }
        format.json { render :show, status: :created, location: @project_employee_role }
      else
        format.html { render :new }
        format.json { render json: @project_employee_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_employee_roles/1
  # PATCH/PUT /project_employee_roles/1.json
  def update
    respond_to do |format|
      if @project_employee_role.update(project_employee_role_params)
        format.html { redirect_to @project_employee_role, notice: 'Project employee role was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_employee_role }
      else
        format.html { render :edit }
        format.json { render json: @project_employee_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_employee_roles/1
  # DELETE /project_employee_roles/1.json
  def destroy
    @project_employee_role.destroy
    respond_to do |format|
      format.html { redirect_to project_employee_roles_url, notice: 'Project employee role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_employee_role
      @project_employee_role = ProjectEmployeeRole.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_employee_role_params
      params.require(:project_employee_role).permit(:project_employee_id, :role_id, :is_active)
    end
end
