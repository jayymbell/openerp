class ProjectCustomersController < ApplicationController
  before_action :set_project_customer, only: [:show, :edit, :update, :destroy]
  before_action :set_available_customers, only: [:new, :create, :edit, :update]
  before_action :set_available_projects, only: [:new, :create, :edit, :update]

  # GET /project_customers
  # GET /project_customers.json
  def index
    @project_customers = ProjectCustomer.all
  end

  # GET /project_customers/1
  # GET /project_customers/1.json
  def show
  end

  # GET /project_customers/new
  def new
    @project_customer = ProjectCustomer.new
    @project_customer.is_active = true
    @project_customer.customer = params[:customer_id].present? ? Customer.find(params[:customer_id]) : nil
    @project_customer.project = params[:project_id].present? ? Project.find(params[:project_id]) : nil
    set_available_roles
  end

  # GET /project_customers/1/edit
  def edit
    set_available_roles
  end

  # POST /project_customers
  # POST /project_customers.json
  def create
    @project_customer = ProjectCustomer.new(project_customer_params)

    respond_to do |format|
      if @project_customer.save
        flash_message(:success, "Project customer successfully created.")
        format.html { redirect_to @project_customer, notice: 'Project customer was successfully created.' }
        format.json { render :show, status: :created, location: @project_customer }
        format.js {render js:'window.location.reload();'}
      else
        set_available_roles
        format.html { render :new }
        format.json { render json: @project_customer.errors, status: :unprocessable_entity }
        format.js {render 'new'}
      end
    end
  end

  # PATCH/PUT /project_customers/1
  # PATCH/PUT /project_customers/1.json
  def update
    delete_project_customer_roles
    respond_to do |format|
      if @project_customer.update(project_customer_params)
        flash_message(:success, "Project customer successfully updated.")
        format.html { redirect_to @project_customer, notice: 'Project customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_customer }
        format.js {render js:'window.location.reload();'}
      else
        set_available_roles
        format.html { render :edit }
        format.json { render json: @project_customer.errors, status: :unprocessable_entity }
        format.js {render 'edit'}
      end
    end
  end

  # DELETE /project_customers/1
  # DELETE /project_customers/1.json
  def destroy
    @project_customer.destroy
    respond_to do |format|
      flash_message(:success, "Project customer successfully deleted.")
      format.html { redirect_to project_customers_url, notice: 'Project customer was successfully destroyed.' }
      format.json { head :no_content }
      format.js {render js:'window.location.reload();'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_customer
      @project_customer = ProjectCustomer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_customer_params
      params.require(:project_customer).permit(:project_id, :customer_id, :is_active, project_customer_roles_attributes: [:id, :role_id])
    end
    def set_available_customers
      @available_customers = params[:customer_id].present? ? Customer.where(id: params[:customer_id]) : Customer.all
    end
    def set_available_projects
      @available_projects = params[:project_id].present? ? Project.where(id: params[:project_id]) : Project.all
    end

    def set_available_roles
      @available_roles = @project_customer.project_customer_roles.any? ? Role.where(category: 'project').where.not(id: @project_customer.project_customer_roles.pluck(:role_id)) : Role.where(category: 'project')
    end

    def delete_project_customer_roles
      @project_customer.project_customer_roles.each do |pcr|
        remove_pcr = true
        puts project_customer_params.inspect
        if project_customer_params[:project_customer_roles_attributes].present?
          project_customer_params[:project_customer_roles_attributes].each do |p|
            if p[1][:id].to_s == pcr.id.to_s 
              remove_pcr = false
            end
          end
          if remove_pcr
            @project_customer.project_customer_roles.delete(pcr)
          end
        else
          @project_customer.project_customer_roles.destroy_all
        end
      end
    end
end
