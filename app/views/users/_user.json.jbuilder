json.extract! user, :id, :person_id, :activation_digest, :activation_sent_at, :activation_at, :reset_digest, :reset_sent_at, :reset_at, :password_digest, :is_active, :created_at, :updated_at
json.url user_url(user, format: :json)
