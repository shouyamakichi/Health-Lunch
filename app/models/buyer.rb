class Buyer < ApplicationRecord
  belongs_to :user
  belongs_to :protein
  has_one :delivery
end
