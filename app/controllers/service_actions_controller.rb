class ServiceActionsController < ApplicationController
  before_action :set_service_action, only: %i[ show edit update destroy ]

  # GET /service_actions or /service_actions.json
  def index
    @service_actions = ServiceAction.all
  end

  # GET /service_actions/1 or /service_actions/1.json
  def show
  end

  # GET /service_actions/new
  def new
    @service_action = ServiceAction.new
    @service_action.service = params[:service_id].present? ? Service.find(params[:service_id]) : nil
  end

  # GET /service_actions/1/edit
  def edit
  end

  # POST /service_actions or /service_actions.json
  def create
    @service_action = ServiceAction.new(service_action_params)

    respond_to do |format|
      if @service_action.save
        flash_message(:success, "Service action successfully created.")
        format.html { redirect_to @service_action, notice: "Service action was successfully created." }
        format.json { render :show, status: :created, location: @service_action }
        format.js {render js:'window.location.reload();'}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service_action.errors, status: :unprocessable_entity }
        format.js {render 'new'}
      end
    end
  end

  # PATCH/PUT /service_actions/1 or /service_actions/1.json
  def update
    respond_to do |format|
      if @service_action.update(service_action_params)
        flash_message(:success, "Service action successfully updated.")
        format.html { redirect_to @service_action, notice: "Service action was successfully updated." }
        format.json { render :show, status: :ok, location: @service_action }
        format.js {render js:'window.location.reload();'}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service_action.errors, status: :unprocessable_entity }
        format.js {render 'edit'}
      end
    end
  end

  # DELETE /service_actions/1 or /service_actions/1.json
  def destroy
    @service_action.destroy
    respond_to do |format|
      format.html { redirect_to service_actions_url, notice: "Service action was successfully destroyed." }
      format.json { head :no_content }
      format.js {render js:'window.location.reload();'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_action
      @service_action = ServiceAction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_action_params
      params.require(:service_action).permit(:service_id, :name, :description, :url)
    end
end
