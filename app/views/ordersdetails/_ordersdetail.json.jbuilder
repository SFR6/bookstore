json.extract! ordersdetail, :id, :order_id, :book_id, :created_at, :updated_at
json.url ordersdetail_url(ordersdetail, format: :json)
