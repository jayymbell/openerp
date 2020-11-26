class ProductAssembliesController < ApplicationController
  before_action :set_product_assembly, only: [:show, :edit, :update, :destroy]

  # GET /product_assemblies
  # GET /product_assemblies.json
  def index
    @product_assemblies = ProductAssembly.all
  end

  # GET /product_assemblies/1
  # GET /product_assemblies/1.json
  def show
  end

  # GET /product_assemblies/new
  def new
    @product_assembly = ProductAssembly.new
  end

  # GET /product_assemblies/1/edit
  def edit
  end

  # POST /product_assemblies
  # POST /product_assemblies.json
  def create
    @product_assembly = ProductAssembly.new(product_assembly_params)

    respond_to do |format|
      if @product_assembly.save
        format.html { redirect_to @product_assembly, notice: 'Product assembly was successfully created.' }
        format.json { render :show, status: :created, location: @product_assembly }
      else
        format.html { render :new }
        format.json { render json: @product_assembly.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_assemblies/1
  # PATCH/PUT /product_assemblies/1.json
  def update
    respond_to do |format|
      if @product_assembly.update(product_assembly_params)
        format.html { redirect_to @product_assembly, notice: 'Product assembly was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_assembly }
      else
        format.html { render :edit }
        format.json { render json: @product_assembly.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_assemblies/1
  # DELETE /product_assemblies/1.json
  def destroy
    @product_assembly.destroy
    respond_to do |format|
      format.html { redirect_to product_assemblies_url, notice: 'Product assembly was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_assembly
      @product_assembly = ProductAssembly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_assembly_params
      params.require(:product_assembly).permit(:product_id, :name, :description, :is_active)
    end
end
