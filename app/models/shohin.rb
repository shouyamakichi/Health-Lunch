class Shohin < ApplicationRecord
  belongs_to :user
  belongs_to :soft
  has_one :add
end
