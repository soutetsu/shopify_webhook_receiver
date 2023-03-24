class Shopify::OrdersController < ApplicationController
  before_action :set_shopify_order, only: %i[ show edit update destroy ]

  # GET /shopify_orders or /shopify_orders.json
  def index
    @shopify_orders = ShopifyOrder.all
  end

  # GET /shopify_orders/1 or /shopify_orders/1.json
  def show
  end

  # GET /shopify_orders/new
  def new
    @shopify_order = ShopifyOrder.new
  end

  # GET /shopify_orders/1/edit
  def edit
  end

  # POST /shopify_orders or /shopify_orders.json
  def create
    @shopify_order = ShopifyOrder.new(shopify_order_params)

    respond_to do |format|
      if @shopify_order.save
        format.html { redirect_to shopify_order_url(@shopify_order), notice: "Shopify order was successfully created." }
        format.json { render :show, status: :created, location: @shopify_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shopify_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopify_orders/1 or /shopify_orders/1.json
  def update
    respond_to do |format|
      if @shopify_order.update(shopify_order_params)
        format.html { redirect_to shopify_order_url(@shopify_order), notice: "Shopify order was successfully updated." }
        format.json { render :show, status: :ok, location: @shopify_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shopify_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopify_orders/1 or /shopify_orders/1.json
  def destroy
    @shopify_order.destroy

    respond_to do |format|
      format.html { redirect_to shopify_orders_url, notice: "Shopify order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopify_order
      @shopify_order = ShopifyOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shopify_order_params
      params.require(:shopify_order).permit(:webhook_event_name, :webhook_params, :note)
    end
end
