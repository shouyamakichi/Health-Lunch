class Review < ApplicationRecord
  belongs_to :user


  with_options presence: true do
    validates :score
    validates :content
  end

end
