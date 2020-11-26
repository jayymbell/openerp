class EmployeeJobsController < ApplicationController
  before_action :set_employee_job, only: [:show, :edit, :update, :destroy]

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
        format.html { redirect_to @employee_job, notice: 'Employee job was successfully created.' }
        format.json { render :show, status: :created, location: @employee_job }
      else
        format.html { render :new }
        format.json { render json: @employee_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_jobs/1
  # PATCH/PUT /employee_jobs/1.json
  def update
    respond_to do |format|
      if @employee_job.update(employee_job_params)
        format.html { redirect_to @employee_job, notice: 'Employee job was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_job }
      else
        format.html { render :edit }
        format.json { render json: @employee_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_jobs/1
  # DELETE /employee_jobs/1.json
  def destroy
    @employee_job.destroy
    respond_to do |format|
      format.html { redirect_to employee_jobs_url, notice: 'Employee job was successfully destroyed.' }
      format.json { head :no_content }
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
end
