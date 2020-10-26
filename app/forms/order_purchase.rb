class OrderPurchase

  include ActiveModel::Model
  attr_accessor :zip01, :pref01, :addr01, :reference, :building, :phone_number, :token, :cart_id, :total_price

  with_options presence:true do
    validates :zip01, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :reference
    validates :phone_number, format: { with: /\A\d{11}\z/}
    validates :token
  end


  def save
    order = Order.create(total_price: total_price, cart_id: cart_id)
    Purchase.create(zip01: zip01, pref01: pref01, addr01: addr01, reference: reference, building: building, phone_number: phone_number, order_id: order.id)
  end
end