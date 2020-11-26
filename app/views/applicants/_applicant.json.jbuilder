json.extract! applicant, :id, :person_id, :is_active, :created_at, :updated_at
json.url applicant_url(applicant, format: :json)
