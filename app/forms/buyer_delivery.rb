class BuyerDelivery

  include ActiveModel::Model
  attr_accessor :zip, :region, :city, :reference, :building, :phone_number, :user_id, :protein_id, :token

  with_options presence:true do
    validates :zip, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :region
    validates :city, format: { with: /\A[一-龥ぁ-ん]/}
    validates :reference
    validates :phone_number, format: { with: /\A\d{11}\z/}
    validates :token
  end

  def save
    buyer = Buyer.create(user_id: user_id, protein_id: protein_id)
    Delivery.create(zip: zip, region: region, city: city, reference: reference, building: building, phone_number: phone_number, buyer_id: buyer.id)
  end
end