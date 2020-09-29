class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
<<<<<<< Updated upstream
    @item = Item.all
=======
    @items = Item.all
<<<<<<< Updated upstream
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
>>>>>>> Stashed changes
  end

  def show
    @item = Item.find(params[:id])
    @reviews = Reviews.new
  end 


  private

  def items_params
    params.require(:item).permit(:name).merge(user_id: current_user.id)
  end
=======
  end

  def show
    @item = Item.find(params[:id])
    @review = Review.new
  end 

>>>>>>> Stashed changes
end