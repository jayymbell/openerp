json.extract! service_employee, :id, :employee_id, :service_id, :is_active, :is_primary, :created_at, :updated_at
json.url service_employee_url(service_employee, format: :json)
