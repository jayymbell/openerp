class CustomerOrganizationsController < ApplicationController
  before_action :set_customer_organization, only: [:show, :edit, :update, :destroy]
  before_action :set_available_customers, only: [:new, :create, :edit, :update]
  before_action :set_available_organizations, only: [:new, :create, :edit, :update]

  # GET /customer_organizations
  # GET /customer_organizations.json
  def index
    @customer_organizations = CustomerOrganization.all
  end

  # GET /customer_organizations/1
  # GET /customer_organizations/1.json
  def show
  end

  # GET /customer_organizations/new
  def new
    @customer_organization = CustomerOrganization.new
    @customer_organization.is_active = true
    @customer_organization.customer = params[:customer_id].present? ? Customer.find(params[:customer_id]) : nil
    @customer_organization.organization = params[:organization_id].present? ? Organization.find(params[:organization_id]) : nil
  end

  # GET /customer_organizations/1/edit
  def edit
  end

  # POST /customer_organizations
  # POST /customer_organizations.json
  def create
    @customer_organization = CustomerOrganization.new(customer_organization_params)

    respond_to do |format|
      if @customer_organization.save
        flash_message(:success, "Customer organization successfully created.")
        format.html { redirect_to @customer_organization, notice: 'Customer organization was successfully created.' }
        format.json { render :show, status: :created, location: @customer_organization }
        format.js {render js:'window.location.reload();'}
      else
        format.html { render :new }
        format.json { render json: @customer_organization.errors, status: :unprocessable_entity }
        format.js {render 'new'}
      end
    end
  end

  # PATCH/PUT /customer_organizations/1
  # PATCH/PUT /customer_organizations/1.json
  def update
    respond_to do |format|
      if @customer_organization.update(customer_organization_params)
        flash_message(:success, "Customer organization successfully updated.")
        format.html { redirect_to @customer_organization, notice: 'Customer organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_organization }
        format.js {render js:'window.location.reload();'}
      else
        format.html { render :edit }
        format.json { render json: @customer_organization.errors, status: :unprocessable_entity }
        format.js {render 'edit'}
      end
    end
  end

  # DELETE /customer_organizations/1
  # DELETE /customer_organizations/1.json
  def destroy
    @customer_organization.destroy
    respond_to do |format|
      flash_message(:success, "Customer organization successfully deleted.")
      format.html { redirect_to customer_organizations_url, notice: 'Customer organization was successfully destroyed.' }
      format.json { head :no_content }
      format.js {render js:'window.location.reload();'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_organization
      @customer_organization = CustomerOrganization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_organization_params
      params.require(:customer_organization).permit(:customer_id, :organization_id, :is_active)
    end

    def set_available_customers
      @available_customers = params[:customer_id].present? ? Customer.where(id: params[:customer_id]) : Customer.all
    end
    def set_available_organizations
      @available_organizations = params[:organization_id].present? ? Organization.where(id: params[:organization_id]) : Organization.all
    end
end
