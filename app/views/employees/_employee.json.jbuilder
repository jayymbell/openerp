json.extract! employee, :id, :person_id, :is_active, :created_at, :updated_at
json.url employee_url(employee, format: :json)
