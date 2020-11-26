class ProductAssemblyComponentsController < ApplicationController
  before_action :set_product_assembly_component, only: [:show, :edit, :update, :destroy]

  # GET /product_assembly_components
  # GET /product_assembly_components.json
  def index
    @product_assembly_components = ProductAssemblyComponent.all
  end

  # GET /product_assembly_components/1
  # GET /product_assembly_components/1.json
  def show
  end

  # GET /product_assembly_components/new
  def new
    @product_assembly_component = ProductAssemblyComponent.new
  end

  # GET /product_assembly_components/1/edit
  def edit
  end

  # POST /product_assembly_components
  # POST /product_assembly_components.json
  def create
    @product_assembly_component = ProductAssemblyComponent.new(product_assembly_component_params)

    respond_to do |format|
      if @product_assembly_component.save
        format.html { redirect_to @product_assembly_component, notice: 'Product assembly component was successfully created.' }
        format.json { render :show, status: :created, location: @product_assembly_component }
      else
        format.html { render :new }
        format.json { render json: @product_assembly_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_assembly_components/1
  # PATCH/PUT /product_assembly_components/1.json
  def update
    respond_to do |format|
      if @product_assembly_component.update(product_assembly_component_params)
        format.html { redirect_to @product_assembly_component, notice: 'Product assembly component was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_assembly_component }
      else
        format.html { render :edit }
        format.json { render json: @product_assembly_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_assembly_components/1
  # DELETE /product_assembly_components/1.json
  def destroy
    @product_assembly_component.destroy
    respond_to do |format|
      format.html { redirect_to product_assembly_components_url, notice: 'Product assembly component was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_assembly_component
      @product_assembly_component = ProductAssemblyComponent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_assembly_component_params
      params.require(:product_assembly_component).permit(:product_assembly_id, :component_id, :quantity, :cost, :margin)
    end
end
