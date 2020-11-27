class EmployeeJobsController < ApplicationController
  before_action :set_employee_job, only: [:show, :edit, :update, :destroy]
  before_action :set_available_employees, only: [:new, :create, :edit, :update]
  before_action :set_available_jobs, only: [:new, :create, :edit, :update]

  # GET /employee_jobs
  # GET /employee_jobs.json
  def index
    @employee_jobs = EmployeeJob.all
  end

  # GET /employee_jobs/1
  # GET /employee_jobs/1.json
  def show
  end

  # GET /employee_jobs/new
  def new
    @employee_job = EmployeeJob.new
    @employee_job.employee = params[:employee_id].present? ? Employee.find(params[:employee_id]) : nil
    @employee_job.job = params[:job_id].present? ? Job.find(params[:job_id]) : nil
  end

  # GET /employee_jobs/1/edit
  def edit
  end

  # POST /employee_jobs
  # POST /employee_jobs.json
  def create
    @employee_job = EmployeeJob.new(employee_job_params)

    respond_to do |format|
      if @employee_job.save
        flash_message(:success, "Employee job successfully created.")
        format.html { redirect_to @employee_job, notice: 'Employee job was successfully created.' }
        format.json { render :show, status: :created, location: @employee_job }
        format.js {render js:'window.location.reload();'}
      else
        format.html { render :new }
        format.json { render json: @employee_job.errors, status: :unprocessable_entity }
        format.js {render 'new'}
      end
    end
  end

  # PATCH/PUT /employee_jobs/1
  # PATCH/PUT /employee_jobs/1.json
  def update
    respond_to do |format|
      if @employee_job.update(employee_job_params)
        flash_message(:success, "Employee job successfully updated.")
        format.html { redirect_to @employee_job, notice: 'Employee job was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_job }
        format.js {render js:'window.location.reload();'}
      else
        format.html { render :edit }
        format.json { render json: @employee_job.errors, status: :unprocessable_entity }
        format.js {render 'edit'}
      end
    end
  end

  # DELETE /employee_jobs/1
  # DELETE /employee_jobs/1.json
  def destroy
    @employee_job.destroy
    respond_to do |format|
      flash_message(:success, "Employee job successfully deleted.")
      format.html { redirect_to employee_jobs_url, notice: 'Employee job was successfully destroyed.' }
      format.json { head :no_content }
      format.js {render js:'window.location.reload();'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_job
      @employee_job = EmployeeJob.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_job_params
      params.require(:employee_job).permit(:employee_id, :job_id, :is_active, :is_primary)
    end

    def set_available_employees
      @available_employees = params[:employee_id].present? ? Employee.where(id: params[:employee_id]) : Employee.all
    end
    def set_available_jobs
      @available_jobs = params[:job_id].present? ? Job.where(id: params[:job_id]) : Job.all
    end
end
