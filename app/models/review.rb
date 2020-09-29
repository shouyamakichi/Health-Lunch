class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item
<<<<<<< Updated upstream
=======

  # validates :score, presence: true
>>>>>>> Stashed changes
end
