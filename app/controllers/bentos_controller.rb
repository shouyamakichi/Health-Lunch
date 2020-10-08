class BentosController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :seconds_item, only: [:index, :create]


  def index
    @bento = BentoDeli.new
  end

  def create
    @bento = BentoDeli.new(bento_params)
      if @bento.valid?
        @bento.save
        pay_item
        redirect_to calos_path
      else
        render 'index'
      end
  end

  def bento_params
    params.require(:bento_deli).permit(:zip01,:pref01, :addr01, :reference, :building, :phone_number, :token).merge(user_id: current_user.id, calo_id: @calo.id)
  end

  def pay_item
    @calo = Calo.find(params[:calo_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @calo.price,
      card: bento_params[:token],
      currency:'jpy'
    )
  end

  private

  def seconds_item
    @calo = Calo.find(params[:calo_id])
  end
end
