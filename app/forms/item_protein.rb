class ItemProtein

  include ActiveModel::Model
  attr_accessor :name, :acount, :price, :energy, :prote, :salt, :Lipid, :carbo, :user_id

  # with_options presence: true do
  #   validates :name
  #   validates :acount
  #   validates :price
  #   validates :energy
  #   validates :prote
  #   validates :salt
  #   validates :Lipid
  #   validates :carbo
  # end

  def save
    item = Item.create(name: name, acount: acount, price: price, energy: energy, prote: prote, salt: salt, Lipid: Lipid, carbo: carbo, user_id: user_id)
    Protein.create((name: name, acount: acount, price: price, energy: energy, prote: prote, salt: salt, Lipid: Lipid, carbo: carbo)
  end
end