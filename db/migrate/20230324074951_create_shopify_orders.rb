class CreateShopifyOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :shopify_orders do |t|
      t.string :webhook_event_name
      t.text :webhook_params
      t.text :note

      t.timestamps
    end
  end
end
