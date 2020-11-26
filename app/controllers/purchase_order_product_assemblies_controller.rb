class PurchaseOrderProductAssembliesController < ApplicationController
  before_action :set_purchase_order_product_assembly, only: [:show, :edit, :update, :destroy]

  # GET /purchase_order_product_assemblies
  # GET /purchase_order_product_assemblies.json
  def index
    @purchase_order_product_assemblies = PurchaseOrderProductAssembly.all
  end

  # GET /purchase_order_product_assemblies/1
  # GET /purchase_order_product_assemblies/1.json
  def show
  end

  # GET /purchase_order_product_assemblies/new
  def new
    @purchase_order_product_assembly = PurchaseOrderProductAssembly.new
  end

  # GET /purchase_order_product_assemblies/1/edit
  def edit
  end

  # POST /purchase_order_product_assemblies
  # POST /purchase_order_product_assemblies.json
  def create
    @purchase_order_product_assembly = PurchaseOrderProductAssembly.new(purchase_order_product_assembly_params)

    respond_to do |format|
      if @purchase_order_product_assembly.save
        format.html { redirect_to @purchase_order_product_assembly, notice: 'Purchase order product assembly was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_order_product_assembly }
      else
        format.html { render :new }
        format.json { render json: @purchase_order_product_assembly.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_order_product_assemblies/1
  # PATCH/PUT /purchase_order_product_assemblies/1.json
  def update
    respond_to do |format|
      if @purchase_order_product_assembly.update(purchase_order_product_assembly_params)
        format.html { redirect_to @purchase_order_product_assembly, notice: 'Purchase order product assembly was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_order_product_assembly }
      else
        format.html { render :edit }
        format.json { render json: @purchase_order_product_assembly.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_order_product_assemblies/1
  # DELETE /purchase_order_product_assemblies/1.json
  def destroy
    @purchase_order_product_assembly.destroy
    respond_to do |format|
      format.html { redirect_to purchase_order_product_assemblies_url, notice: 'Purchase order product assembly was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order_product_assembly
      @purchase_order_product_assembly = PurchaseOrderProductAssembly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchase_order_product_assembly_params
      params.require(:purchase_order_product_assembly).permit(:purchase_order_id, :product_assembly_id, :quantity, :total)
    end
end
