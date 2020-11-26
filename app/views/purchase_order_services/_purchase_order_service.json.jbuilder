json.extract! purchase_order_service, :id, :purchase_order_id, :service_id, :total, :created_at, :updated_at
json.url purchase_order_service_url(purchase_order_service, format: :json)
