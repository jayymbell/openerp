json.extract! service, :id, :name, :description, :is_active, :created_at, :updated_at
json.url service_url(service, format: :json)
