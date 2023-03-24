class Shopify::WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def order_update
    Rails.logger.debug JSON.pretty_generate(params)
    order = ShopifyOrder.new
    order.webhook_event_name = request.headers['HTTP_X_SHOPIFY_TOPIC']
    order.webhook_params = params.to_json
    if order.save
      head :ok
    else
      head :bad_request
    end
  end
end
