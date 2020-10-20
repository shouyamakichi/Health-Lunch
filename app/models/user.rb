class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :proteins
  has_many :softs
  has_many :calos
  has_many :reviews, dependent: :destroy
  has_many :sns_credentials
  

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      email: auth.info.email)
    # userが登録済みが判断
    if user.persisted?
      sns.user = user
      sns.save
    end
    {user: user, sns: sns }
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  with_options presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/} do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/} do
    validates :last_name_kana
    validates :first_name_kana
  end

  
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
    validates :email, uniqueness: { case_sensitive: true }

end
