class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @reviews = Reviews.new
  end 


  private

  def items_params
    params.require(:item).permit(:name).merge(user_id: current_user.id)
  end
end