json.extract! customer, :id, :person_id, :is_active, :created_at, :updated_at
json.url customer_url(customer, format: :json)
