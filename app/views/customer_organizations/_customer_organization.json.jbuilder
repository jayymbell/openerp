json.extract! customer_organization, :id, :customer_id, :organization_id, :is_active, :created_at, :updated_at
json.url customer_organization_url(customer_organization, format: :json)
