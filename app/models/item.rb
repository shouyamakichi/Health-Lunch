class Item < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user
<<<<<<< Updated upstream
  has_one_attached :image
<<<<<<< Updated upstream
  has_many :reviews
=======
  belongs_to :protein
=======
  belongs_to :protein


  def avg_score
    unless self.reviews.empty?
      # reviews.average(:score).to_f
    else
      0.0
    end
  end

  def review_score_percentage
    unless self.reviews.empty?
      # reviews.average(:score).to_f*100/5
    else
      0.0
    end
  end
>>>>>>> Stashed changes
>>>>>>> Stashed changes
end
