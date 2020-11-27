json.extract! project_employee, :id, :project_id, :employee_id, :is_active, :created_at, :updated_at
json.url project_employee_url(project_employee, format: :json)
