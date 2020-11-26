json.extract! employee_department, :id, :employee_id, :department_id, :is_active, :created_at, :updated_at
json.url employee_department_url(employee_department, format: :json)
