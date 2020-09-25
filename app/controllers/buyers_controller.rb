class BuyersController < ApplicationController
  def index
    @protein = Protein.find(params[:protein_id])
    @buyer = BuyerDelivery.new
  end

  def create
    @protein = Protein.find(params[:protein_id])
    @buyer =BuyerDelivery.new(buyer_params)
      if @buyer.valid?
        @buyer.save
        redirect_to proteins_path
      else
        render 'index'
      end
  end

  def buyer_params
    params.require(:buyer_delivery).permit(:zip, :region, :city, :reference, :building, :phone_number).merge(user_id: current_user.id, protein_id: @protein.id)
  end
end
