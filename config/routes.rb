Rails.application.routes.draw do
  namespace :shopify do
    post 'webhooks/order_update', to: 'webhooks#order_update'
    resources :orders, controller: 'orders'
  end
end
