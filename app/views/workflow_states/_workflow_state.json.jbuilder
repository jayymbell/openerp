json.extract! workflow_state, :id, :workflow_id, :name, :description, :is_start, :created_at, :updated_at
json.url workflow_state_url(workflow_state, format: :json)
