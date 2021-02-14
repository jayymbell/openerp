class PurchaseOrderEffortsController < ApplicationController
  before_action :set_purchase_order_effort, only: [:show, :edit, :update, :destroy]

  # GET /purchase_order_efforts
  # GET /purchase_order_efforts.json
  def index
    @purchase_order_efforts = PurchaseOrderEffort.all
  end

  # GET /purchase_order_efforts/1
  # GET /purchase_order_efforts/1.json
  def show
  end

  # GET /purchase_order_efforts/new
  def new
    @purchase_order_effort = PurchaseOrderEffort.new
  end

  # GET /purchase_order_efforts/1/edit
  def edit
  end

  # POST /purchase_order_efforts
  # POST /purchase_order_efforts.json
  def create
    @purchase_order_effort = PurchaseOrderEffort.new(purchase_order_effort_params)

    respond_to do |format|
      if @purchase_order_effort.save
        format.html { redirect_to @purchase_order_effort, notice: 'Purchase order effort was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_order_effort }
      else
        format.html { render :new }
        format.json { render json: @purchase_order_effort.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_order_efforts/1
  # PATCH/PUT /purchase_order_efforts/1.json
  def update
    respond_to do |format|
      if @purchase_order_effort.update(purchase_order_effort_params)
        format.html { redirect_to @purchase_order_effort, notice: 'Purchase order effort was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_order_effort }
      else
        format.html { render :edit }
        format.json { render json: @purchase_order_effort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_order_efforts/1
  # DELETE /purchase_order_efforts/1.json
  def destroy
    @purchase_order_effort.destroy
    respond_to do |format|
      format.html { redirect_to purchase_order_efforts_url, notice: 'Purchase order effort was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order_effort
      @purchase_order_effort = PurchaseOrderEffort.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchase_order_effort_params
      params.require(:purchase_order_effort).permit(:purchase_order_id, :employee_id, :total)
    end
end
