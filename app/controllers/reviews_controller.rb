class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @item = Item.find(params[:item_id])
    @reviews = @item.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to items_path
    else
      @item = Item.find(params[:item_id])
      render "items/show"
    end
  end

  private
  def review_params
    params.require(:review).permit(:item_id, :score, :content)
  end
end

