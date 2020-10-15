class ShohinAdd

  include ActiveModel::Model
  attr_accessor :zip01, :pref01, :addr01, :reference, :building, :phone_number, :user_id, :soft_id, :token

  with_options presence:true do
    validates :zip01, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :reference
    validates :phone_number, format: { with: /\A\d{11}\z/}
    validates :token
  end

  def save
    shohin = Shohin.create(user_id: user_id, soft_id: soft_id)
    Add.create(zip01: zip01, pref01: pref01, addr01: addr01, reference: reference, building: building, phone_number: phone_number, shohin_id: shohin.id)
  end
end