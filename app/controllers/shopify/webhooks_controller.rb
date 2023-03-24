class Shopify::WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def order_update
    head :ok
  end
end
