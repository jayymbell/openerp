class ProjectCustomerRolesController < ApplicationController
  before_action :set_project_customer_role, only: [:show, :edit, :update, :destroy]

  # GET /project_customer_roles
  # GET /project_customer_roles.json
  def index
    @project_customer_roles = ProjectCustomerRole.all
  end

  # GET /project_customer_roles/1
  # GET /project_customer_roles/1.json
  def show
  end

  # GET /project_customer_roles/new
  def new
    @project_customer_role = ProjectCustomerRole.new
  end

  # GET /project_customer_roles/1/edit
  def edit
  end

  # POST /project_customer_roles
  # POST /project_customer_roles.json
  def create
    @project_customer_role = ProjectCustomerRole.new(project_customer_role_params)

    respond_to do |format|
      if @project_customer_role.save
        format.html { redirect_to @project_customer_role, notice: 'Project customer role was successfully created.' }
        format.json { render :show, status: :created, location: @project_customer_role }
      else
        format.html { render :new }
        format.json { render json: @project_customer_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_customer_roles/1
  # PATCH/PUT /project_customer_roles/1.json
  def update
    respond_to do |format|
      if @project_customer_role.update(project_customer_role_params)
        format.html { redirect_to @project_customer_role, notice: 'Project customer role was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_customer_role }
      else
        format.html { render :edit }
        format.json { render json: @project_customer_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_customer_roles/1
  # DELETE /project_customer_roles/1.json
  def destroy
    @project_customer_role.destroy
    respond_to do |format|
      format.html { redirect_to project_customer_roles_url, notice: 'Project customer role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_customer_role
      @project_customer_role = ProjectCustomerRole.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_customer_role_params
      params.require(:project_customer_role).permit(:project_customer_id, :role_id, :is_active)
    end
end
