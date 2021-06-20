json.extract! work_order_invoice, :id, :work_order_id, :invoice_id, :allocation, :created_at, :updated_at
json.url work_order_invoice_url(work_order_invoice, format: :json)
