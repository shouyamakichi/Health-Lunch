class BuyersController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :set_item, only: [:index, :create]


  def index
    @buyer = BuyerDelivery.new
  end

  def create
    @buyer = BuyerDelivery.new(buyer_params)
      if @buyer.valid?
        @buyer.save
        pay_item
        redirect_to proteins_path
      else
        render 'index'
      end
  end

  def buyer_params
    params.require(:buyer_delivery).permit(:zip01,:pref01, :addr01, :reference, :building, :phone_number, :token).merge(user_id: current_user.id, protein_id: @protein.id,)
  end

  def pay_item
    @protein = Protein.find(params[:protein_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @protein.price,
      card: buyer_params[:token],
      currency:'jpy'
    )
  end

  private

  def set_item
    @protein = Protein.find(params[:protein_id])
  end
end
