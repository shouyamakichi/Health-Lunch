class Order < ApplicationRecord
  has_one :purchase
  belongs_to :cart
end
