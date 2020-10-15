class BuyerDelivery

  include ActiveModel::Model
  attr_accessor :zip01, :pref01, :addr01, :reference, :building, :phone_number, :user_id, :protein_id, :token

  with_options presence:true do
    validates :zip01, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :reference
    validates :phone_number, format: { with: /\A\d{11}\z/}
    validates :token
  end

  def save
    buyer = Buyer.create(user_id: user_id, protein_id: protein_id)
    Delivery.create(zip01: zip01, pref01: pref01, addr01: addr01, reference: reference, building: building, phone_number: phone_number, buyer_id: buyer.id)
  end
end