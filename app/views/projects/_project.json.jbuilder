json.extract! project, :id, :name, :description, :is_active, :created_at, :updated_at
json.url project_url(project, format: :json)
