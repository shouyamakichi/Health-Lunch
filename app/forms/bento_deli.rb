class BentoDeli

  include ActiveModel::Model
  attr_accessor :zip01, :pref01, :addr01, :reference, :building, :phone_number, :user_id, :calo_id, :token

  with_options presence:true do
    validates :zip01
    validates :reference
    validates :phone_number, format: { with: /\A\d{11}\z/}
    validates :token
  end

  def save
    bento = Bento.create(user_id: user_id, calo_id: calo_id)
    Deli.create(zip01: zip01, pref01: pref01, addr01: addr01, reference: reference, building: building, phone_number: phone_number, bento_id: bento.id)
  end
end