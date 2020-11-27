class ProjectCustomersController < ApplicationController
  before_action :set_project_customer, only: [:show, :edit, :update, :destroy]

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
  end

  # GET /project_customers/1/edit
  def edit
  end

  # POST /project_customers
  # POST /project_customers.json
  def create
    @project_customer = ProjectCustomer.new(project_customer_params)

    respond_to do |format|
      if @project_customer.save
        format.html { redirect_to @project_customer, notice: 'Project customer was successfully created.' }
        format.json { render :show, status: :created, location: @project_customer }
      else
        format.html { render :new }
        format.json { render json: @project_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_customers/1
  # PATCH/PUT /project_customers/1.json
  def update
    respond_to do |format|
      if @project_customer.update(project_customer_params)
        format.html { redirect_to @project_customer, notice: 'Project customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_customer }
      else
        format.html { render :edit }
        format.json { render json: @project_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_customers/1
  # DELETE /project_customers/1.json
  def destroy
    @project_customer.destroy
    respond_to do |format|
      format.html { redirect_to project_customers_url, notice: 'Project customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_customer
      @project_customer = ProjectCustomer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_customer_params
      params.require(:project_customer).permit(:project_id, :customer_id, :is_active)
    end
end
