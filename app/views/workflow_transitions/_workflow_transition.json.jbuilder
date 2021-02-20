json.extract! workflow_transition, :id, :workflow_id, :name, :description, :source_state_id, :target_state_id, :created_at, :updated_at
json.url workflow_transition_url(workflow_transition, format: :json)
