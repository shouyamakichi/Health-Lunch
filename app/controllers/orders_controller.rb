class OrdersController < ApplicationController

  def index
    @carts = Cart.find_by(params[:cart_id])
    @order = OrderPurchase.new
    @cart = current_cart
    
    respond_to do |format|
      format.html
      format.json { render json: @order}
    end
  end
  
  def create
    @carts = Cart.find_by(params[:cart_id])
    @order = OrderPurchase.new(order_params)
    @cart = current_cart 
    if @order.valid?
      @order.save
      pay_item
      Cart.destroy(session[:cart_id])
	    session[:cart_id] = nil
      redirect_to root_path
    else
      render "index"
    end
  end

  def order_params
    params.require(:order_purchase).permit(:zip01, :pref01, :addr01, :reference, :building, :phone_number, :total_price, :token).merge(cart_id: current_cart.id)
  end

  def pay_item
    @carts = Cart.find_by(params[:cart_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @order.total_price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
end

