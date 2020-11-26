class ApplicantJobsController < ApplicationController
  before_action :set_applicant_job, only: [:show, :edit, :update, :destroy]

  # GET /applicant_jobs
  # GET /applicant_jobs.json
  def index
    @applicant_jobs = ApplicantJob.all
  end

  # GET /applicant_jobs/1
  # GET /applicant_jobs/1.json
  def show
  end

  # GET /applicant_jobs/new
  def new
    @applicant_job = ApplicantJob.new
  end

  # GET /applicant_jobs/1/edit
  def edit
  end

  # POST /applicant_jobs
  # POST /applicant_jobs.json
  def create
    @applicant_job = ApplicantJob.new(applicant_job_params)

    respond_to do |format|
      if @applicant_job.save
        format.html { redirect_to @applicant_job, notice: 'Applicant job was successfully created.' }
        format.json { render :show, status: :created, location: @applicant_job }
      else
        format.html { render :new }
        format.json { render json: @applicant_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applicant_jobs/1
  # PATCH/PUT /applicant_jobs/1.json
  def update
    respond_to do |format|
      if @applicant_job.update(applicant_job_params)
        format.html { redirect_to @applicant_job, notice: 'Applicant job was successfully updated.' }
        format.json { render :show, status: :ok, location: @applicant_job }
      else
        format.html { render :edit }
        format.json { render json: @applicant_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicant_jobs/1
  # DELETE /applicant_jobs/1.json
  def destroy
    @applicant_job.destroy
    respond_to do |format|
      format.html { redirect_to applicant_jobs_url, notice: 'Applicant job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant_job
      @applicant_job = ApplicantJob.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def applicant_job_params
      params.require(:applicant_job).permit(:applicant_id, :job_id, :is_active, :is_primary)
    end
end
