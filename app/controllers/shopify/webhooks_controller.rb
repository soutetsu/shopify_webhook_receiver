class Shopify::WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  # webhook を厳密に検証する場合はコメントアウト
  # before_action :verify_webhook

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

  private

  # webhook を厳密に検証する場合はコメントアウト
  # def verify_webhook
  #   request.body.rewind
  #   data = request.body.read
  #   secret = Rails.application.credentials.shopify[:webhook][:shared_secret]
  #   requested_hmac = request.headers['HTTP_X_SHOPIFY_HMAC_SHA256']
  #   calculated_hmac = Base64.strict_encode64(OpenSSL::HMAC.digest('sha256', secret, data))
  #   unless ActiveSupport::SecurityUtils.secure_compare(calculated_hmac, requested_hmac)
  #     Rails.logger.error '[shopify:webhooks] Invalid request hmac!'
  #     head :bad_request
  #   end
  # end
end
