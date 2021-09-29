class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,        presence: true
  validates :email,           presence: true, uniqueness: true
  validates :password,        presence: true, format: { with: /[a-z\d]{6,}/i }
  validates :first_name, :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
  validates :first_name_kana
  validates :last_name_kana
  end
  validates :birthday,        presence: true

  has_many :items
  has_many :purchase_informations
end