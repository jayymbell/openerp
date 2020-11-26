require 'test_helper'

class ApplicantJobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @applicant_job = applicant_jobs(:one)
  end

  test "should get index" do
    get applicant_jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_applicant_job_url
    assert_response :success
  end

  test "should create applicant_job" do
    assert_difference('ApplicantJob.count') do
      post applicant_jobs_url, params: { applicant_job: { applicant_id: @applicant_job.applicant_id, is_active: @applicant_job.is_active, is_primary: @applicant_job.is_primary, job_id: @applicant_job.job_id } }
    end

    assert_redirected_to applicant_job_url(ApplicantJob.last)
  end

  test "should show applicant_job" do
    get applicant_job_url(@applicant_job)
    assert_response :success
  end

  test "should get edit" do
    get edit_applicant_job_url(@applicant_job)
    assert_response :success
  end

  test "should update applicant_job" do
    patch applicant_job_url(@applicant_job), params: { applicant_job: { applicant_id: @applicant_job.applicant_id, is_active: @applicant_job.is_active, is_primary: @applicant_job.is_primary, job_id: @applicant_job.job_id } }
    assert_redirected_to applicant_job_url(@applicant_job)
  end

  test "should destroy applicant_job" do
    assert_difference('ApplicantJob.count', -1) do
      delete applicant_job_url(@applicant_job)
    end

    assert_redirected_to applicant_jobs_url
  end
end
