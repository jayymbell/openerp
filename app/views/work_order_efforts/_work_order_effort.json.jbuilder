json.extract! work_order_effort, :id, :work_order_id, :short_description, :long_description, :employee_id, :hours, :created_at, :updated_at
json.url work_order_effort_url(work_order_effort, format: :json)
