json.extract! product_assembly, :id, :product_id, :name, :description, :is_active, :created_at, :updated_at
json.url product_assembly_url(product_assembly, format: :json)
