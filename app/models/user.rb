class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, presence: true
  validates_format_of :password, with: /\A(?=.*[a-zA-Z])(?=.*\d).*\z/, message: "is invalid. Include both letters and numbers"
  validates :first_name_kanji, presence: true
  validates :first_name, format: { with: /\A[^\p{Alnum}]*\p{Katakana}+[^\p{Alnum}]*\z/, message: "is invalid. Input full-width characters" }
  validates :last_name_kanji, presence: true
  validates :last_name, format: { with: /\A[^\p{Alnum}]*\p{Katakana}+[^\p{Alnum}]*\z/, message: "is invalid. Input full-width characters" }
  validates :first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters" }
  validates :last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters" }
  validates :birth, presence: true
end
