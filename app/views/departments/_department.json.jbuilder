json.extract! department, :id, :name, :description, :is_active, :parent_department_id, :created_at, :updated_at
json.url department_url(department, format: :json)
