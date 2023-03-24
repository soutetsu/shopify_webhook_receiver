json.extract! shopify_order, :id, :webhook_event_name, :webhook_params, :note, :created_at, :updated_at
json.url shopify_order_url(shopify_order, format: :json)
