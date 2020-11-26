json.extract! job, :id, :name, :description, :is_active, :created_at, :updated_at
json.url job_url(job, format: :json)
