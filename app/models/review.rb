class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item

  with_options presence: true do
    validates :score
    validates :content
  end

end
