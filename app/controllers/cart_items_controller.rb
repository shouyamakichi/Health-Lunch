class CartItemsController < ApplicationController
  
  def index
    @cart_items = CartItem.all
  end
  
  def show 
    @cart_item = CartItem.find(params[:id])
  end
  
  def new
    @cart_item = CartItem.new
  end
  
  def edit
    @cart_item = CartItem.find(params[:id])
  end
  
  
  def create
    @cart = current_cart
    protein = Protein.find(params[:protein_id])
    @cart_item = @cart.add_protein(protein.id)
    respond_to do |format|
      if @cart_item.save
        format.html {redirect_to @cart_item.cart, notice: "カートに商品が追加されました"}
        format.json {render :show, status: :created, location: @cart_item}
      else
        format.html{render :new}
        format.json{render json: @cart_item.errors, status: unprocessable_entity }
      end
    end
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to @cart_item, notice: "申込情報が更新されました"}
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html {render :edit}
        format.json {render json: @cart_item.errors, status: :unprocessable_entity}
      end
    end
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_url(@cart_item.cart_id), notice: '商品を削除しました' }
      format.json { head :no_content }
    end
  end
  
  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :protein_id, :cart_id, :soft_id)
  end

end
