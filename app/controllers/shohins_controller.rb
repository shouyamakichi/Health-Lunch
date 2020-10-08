class ShohinsController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :sets_item, only: [:index, :create]


  def index
    @shohin = ShohinAdd.new
  end

  def create
    @shohin = ShohinAdd.new(shohin_params)
      if @shohin.valid?
        @shohin.save
        pay_item
        redirect_to softs_path
      else
        render 'index'
      end
  end

  def shohin_params
    params.require(:shohin_add).permit(:zip01,:pref01, :addr01, :reference, :building, :phone_number, :token).merge(user_id: current_user.id, soft_id: @soft.id)
  end

  def pay_item
    @soft =Soft.find(params[:soft_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @soft.price,
      card: shohin_params[:token],
      currency:'jpy'
    )
  end

  private

  def sets_item
    @soft = Soft.find(params[:soft_id])
  end
end
