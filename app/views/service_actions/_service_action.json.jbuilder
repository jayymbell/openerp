json.extract! service_action, :id, :service_id, :name, :description, :url, :created_at, :updated_at
json.url service_action_url(service_action, format: :json)
