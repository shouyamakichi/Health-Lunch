class CartItem < ApplicationRecord
  belongs_to :protein
  belongs_to :cart

  def total_price
    protein.price * quantity
  end

end


