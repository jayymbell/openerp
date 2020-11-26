json.extract! invoice_line, :id, :invoice_id, :short_description, :long_description, :total, :is_invoiceable, :created_at, :updated_at
json.url invoice_line_url(invoice_line, format: :json)
