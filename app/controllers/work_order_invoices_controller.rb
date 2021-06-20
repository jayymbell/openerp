class WorkOrderInvoicesController < ApplicationController
  before_action :set_work_order_invoice, only: %i[ show edit update destroy ]

  # GET /work_order_invoices or /work_order_invoices.json
  def index
    @work_order_invoices = WorkOrderInvoice.all
  end

  # GET /work_order_invoices/1 or /work_order_invoices/1.json
  def show
  end

  # GET /work_order_invoices/new
  def new
    @work_order_invoice = WorkOrderInvoice.new
  end

  # GET /work_order_invoices/1/edit
  def edit
  end

  # POST /work_order_invoices or /work_order_invoices.json
  def create
    @work_order_invoice = WorkOrderInvoice.new(work_order_invoice_params)

    respond_to do |format|
      if @work_order_invoice.save
        format.html { redirect_to @work_order_invoice, notice: "Work order invoice was successfully created." }
        format.json { render :show, status: :created, location: @work_order_invoice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @work_order_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_order_invoices/1 or /work_order_invoices/1.json
  def update
    respond_to do |format|
      if @work_order_invoice.update(work_order_invoice_params)
        format.html { redirect_to @work_order_invoice, notice: "Work order invoice was successfully updated." }
        format.json { render :show, status: :ok, location: @work_order_invoice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @work_order_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_order_invoices/1 or /work_order_invoices/1.json
  def destroy
    @work_order_invoice.destroy
    respond_to do |format|
      format.html { redirect_to work_order_invoices_url, notice: "Work order invoice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_order_invoice
      @work_order_invoice = WorkOrderInvoice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_order_invoice_params
      params.require(:work_order_invoice).permit(:work_order_id, :invoice_id, :allocation)
    end
end
