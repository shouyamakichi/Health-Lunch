class Calo < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :bento

  with_options presence:true do
    validates :image
    validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :price, format: { with: /\A[0-9]+\z/ },numericality: { only_integer: true}
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

