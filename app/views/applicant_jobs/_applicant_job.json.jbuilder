json.extract! applicant_job, :id, :applicant_id, :job_id, :is_active, :is_primary, :created_at, :updated_at
json.url applicant_job_url(applicant_job, format: :json)
