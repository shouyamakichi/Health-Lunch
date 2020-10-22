class CombineItemsInCart < ActiveRecord::Migration[6.0]
  def up
    Cart.all.each do |cart|
      sums = cart.cart_items.group(:protein_id).sum(:quantity)
      sums.each do |protein_id, quantity|
        if quantity > 1
          cart.cart_items.where(protein_id: protein_id).delete_all
          cart.cart_items.create(protein_id: protein_id, quantity: quantity)
        end
      end
    end
  end

  def down
    CartItem.where("quantity>1").each do |cart_item|
      cart_item.quantity.times do
        CartItem.create cart_id: cart_item.cart_id, protein_id: cart_item.protein_id, quantity:1
      end
      cart_item.destroy
    end
  end
end
