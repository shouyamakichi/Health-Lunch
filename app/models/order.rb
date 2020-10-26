class Order < ApplicationRecord
  has_one :purchase
  belongs_to :cart

  def total_price
  end
  
end
