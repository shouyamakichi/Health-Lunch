class Protein < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :buyer
  ratyrate_rateable "food"

  with_options presence:true do
    validates :image
    validates :name
    validates :price, format: { with: /\A[0-9]+\z/ }
  end
  
  with_options presence: true, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ } do
    validates :energy
    validates :prote
    validates :Lipid
    validates :salt
    validates :carbo
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
    validates :first
    validates :second
    validates :third
    validates :forth
  end
end
