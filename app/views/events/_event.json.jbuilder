json.extract! event, :id, :category, :name, :description, :is_active, :created_at, :updated_at
json.url event_url(event, format: :json)
