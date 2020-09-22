class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    # with_options presence true, format: {with: /\A[ぁ-んァ-ン一-龥]/} do
    #   validates :last_name
    #   validates :first_name
    # end

    # validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
    # validates :email, uniqueness: { case_sensitive: true }
  has_many :items
end
