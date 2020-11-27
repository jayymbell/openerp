json.extract! project_customer, :id, :project_id, :customer_id, :is_active, :created_at, :updated_at
json.url project_customer_url(project_customer, format: :json)
