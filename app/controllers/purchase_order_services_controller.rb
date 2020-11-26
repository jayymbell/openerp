class PurchaseOrderServicesController < ApplicationController
  before_action :set_purchase_order_service, only: [:show, :edit, :update, :destroy]

  # GET /purchase_order_services
  # GET /purchase_order_services.json
  def index
    @purchase_order_services = PurchaseOrderService.all
  end

  # GET /purchase_order_services/1
  # GET /purchase_order_services/1.json
  def show
  end

  # GET /purchase_order_services/new
  def new
    @purchase_order_service = PurchaseOrderService.new
  end

  # GET /purchase_order_services/1/edit
  def edit
  end

  # POST /purchase_order_services
  # POST /purchase_order_services.json
  def create
    @purchase_order_service = PurchaseOrderService.new(purchase_order_service_params)

    respond_to do |format|
      if @purchase_order_service.save
        format.html { redirect_to @purchase_order_service, notice: 'Purchase order service was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_order_service }
      else
        format.html { render :new }
        format.json { render json: @purchase_order_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_order_services/1
  # PATCH/PUT /purchase_order_services/1.json
  def update
    respond_to do |format|
      if @purchase_order_service.update(purchase_order_service_params)
        format.html { redirect_to @purchase_order_service, notice: 'Purchase order service was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_order_service }
      else
        format.html { render :edit }
        format.json { render json: @purchase_order_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_order_services/1
  # DELETE /purchase_order_services/1.json
  def destroy
    @purchase_order_service.destroy
    respond_to do |format|
      format.html { redirect_to purchase_order_services_url, notice: 'Purchase order service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order_service
      @purchase_order_service = PurchaseOrderService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchase_order_service_params
      params.require(:purchase_order_service).permit(:purchase_order_id, :service_id, :total)
    end
end
