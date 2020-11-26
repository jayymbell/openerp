require "application_system_test_case"

class ApplicantJobsTest < ApplicationSystemTestCase
  setup do
    @applicant_job = applicant_jobs(:one)
  end

  test "visiting the index" do
    visit applicant_jobs_url
    assert_selector "h1", text: "Applicant Jobs"
  end

  test "creating a Applicant job" do
    visit applicant_jobs_url
    click_on "New Applicant Job"

    fill_in "Applicant", with: @applicant_job.applicant_id
    check "Is active" if @applicant_job.is_active
    check "Is primary" if @applicant_job.is_primary
    fill_in "Job", with: @applicant_job.job_id
    click_on "Create Applicant job"

    assert_text "Applicant job was successfully created"
    click_on "Back"
  end

  test "updating a Applicant job" do
    visit applicant_jobs_url
    click_on "Edit", match: :first

    fill_in "Applicant", with: @applicant_job.applicant_id
    check "Is active" if @applicant_job.is_active
    check "Is primary" if @applicant_job.is_primary
    fill_in "Job", with: @applicant_job.job_id
    click_on "Update Applicant job"

    assert_text "Applicant job was successfully updated"
    click_on "Back"
  end

  test "destroying a Applicant job" do
    visit applicant_jobs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Applicant job was successfully destroyed"
  end
end
