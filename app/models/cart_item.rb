class CartItem < ApplicationRecord
  belongs_to :protein
  belongs_to :cart
  # belongs_to :order

  def total_price
    protein.price * quantity
  end

end


