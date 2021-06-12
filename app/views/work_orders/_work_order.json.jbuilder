json.extract! work_order, :id, :name, :description, :project_id, :created_at, :updated_at
json.url work_order_url(work_order, format: :json)
