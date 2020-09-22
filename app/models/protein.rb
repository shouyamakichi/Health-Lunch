class Protein < ApplicationRecord
  has_one :item
  belongs_to :user
end
