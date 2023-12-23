json.extract! order, :id, :payment_method_id, :employee_id, :customer_id, :created_at, :updated_at
json.url order_url(order, format: :json)
