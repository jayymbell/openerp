json.extract! work_order_comment, :id, :user_id, :work_order_id, :comment, :created_at, :updated_at
json.url work_order_comment_url(work_order_comment, format: :json)
