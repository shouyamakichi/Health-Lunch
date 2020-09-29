class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @review = Review.new
  end 

end