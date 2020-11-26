json.extract! employee_job, :id, :employee_id, :job_id, :is_active, :is_primary, :created_at, :updated_at
json.url employee_job_url(employee_job, format: :json)
