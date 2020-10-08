class Bento < ApplicationRecord
  belongs_to :user
  belongs_to :calo
  has_one :deli
end
