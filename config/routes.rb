Rails.application.routes.draw do
  # resources :shopify_orders
  namespace :shopify do
    post 'webhooks/order_update', to: 'webhooks#order_update'
    resources :orders, controller: 'orders'
  end
end
