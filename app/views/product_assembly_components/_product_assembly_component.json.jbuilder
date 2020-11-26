json.extract! product_assembly_component, :id, :product_assembly_id, :component_id, :quantity, :cost, :margin, :created_at, :updated_at
json.url product_assembly_component_url(product_assembly_component, format: :json)
