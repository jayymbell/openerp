json.extract! invoice, :id, :customer_id, :starts_on, :date, :ends_on, :total, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
