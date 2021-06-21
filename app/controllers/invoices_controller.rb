class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy, :duplicate]
  before_action :set_available_purchase_orders, only: [:edit, :update]
  after_action :log_event, only: [:update, :create]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @invoice.project = Project.find(params[:project_id])
    set_available_purchase_orders
    set_available_work_orders
    set_available_workflows
  end

  # GET /invoices/1/edit
  def edit
    set_available_purchase_orders
    set_available_work_orders
    set_available_workflows
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.workflow_state = @invoice.workflow.workflow_states.find_by(is_start: true)
    set_available_purchase_orders
    set_available_work_orders
    set_available_workflows
    respond_to do |format|
      if @invoice.save
        flash_message(:success, "Invoice was successfully created.'")
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
        format.js {render js:'window.location.reload();'}
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
        format.js {render 'new'}
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    delete_work_order_invoices
    respond_to do |format|
      if @invoice.update(invoice_params)
        flash_message(:success, "Invoice was successfully updated.'")
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
        format.js {render js:'window.location.reload();'}
      else
        set_available_workflows
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
        format.js {render 'edit'}
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      flash_message(:success, "Invoice was successfully deleted.'")
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
      format.js {render js:'window.location.reload();'}
    end
  end

  def duplicate
    @invoice_dup = @invoice.duplicate
    puts @invoice_dup.inspect
    respond_to do |format|
      if @invoice_dup.save
        flash_message(:success, "Invoice successfully duplicated.")
        format.html { redirect_to @invoice_dup, notice: 'Invoice was successfully duplicated.' }
        format.json { render :show, status: :created, location: @invoice_dup }
        format.js {render js:'window.location.reload();'}
      else
        set_available_purchase_orders
        format.html { render :new }
        format.json { render json: @invoice_dup.errors, status: :unprocessable_entity }
        format.js {render 'new'}
      end
    end
  end

  def set_available_work_orders
    @available_work_orders = @invoice.project.present? ? @invoice.project.work_orders : nil
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def set_available_purchase_orders
      @available_purchase_orders = @invoice.project.present? ? @invoice.project.purchase_orders : nil
    end

    def delete_work_order_invoices
      @invoice.work_order_invoices.each do |woe|
        remove_woi = true
        if invoice_params[:work_order_invoices_attributes].present?
          invoice_params[:work_order_invoices_attributes].each do |p|
            if p[1][:id].to_s == woe.id.to_s 
              remove_woi = false
            end
          end
          if remove_woi
            @invoice.work_order_invoices.delete(woe)
          end
        else
          @invoice.work_order_invoices.destroy_all
        end
      end
    end

    def set_available_workflows
      @available_workflows = Workflow.where(category: 'invoice')
    end


    # Only allow a list of trusted parameters through.
    def invoice_params
      params.require(:invoice).permit(:name, :starts_on, :date, :ends_on, :total, :project_id, :purchase_order_id, :workflow_id, :workflow_state_id, invoice_lines_attributes: [:id, :short_description, :long_description, :total],  work_order_invoices_attributes: [:id, :work_order_id, :allocation])
    end

    def log_event
      if @invoice.saved_change_to_workflow_state_id?
        InvoiceEvent.create(invoice: @invoice, action: @invoice.workflow_state.name, actor: @current_user)
      end
    end
end
