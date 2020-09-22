class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end



  private

  def items_params
    params.require(:item).permit( :image,:name, :acount, :price,:energy, :prote, :salt, :Lipid, :carbo).merge(user_id: current_user.id)
  end
end