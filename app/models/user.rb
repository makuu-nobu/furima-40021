class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX, message: "は半角英数を両方含む必要があります"}
  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[^ -~｡-ﾟ]+\z/, message: "は全角文字のみで入力してください" }
  validates :last_name, presence: true, format: { with: /\A[^ -~｡-ﾟ]+\z/, message: "は全角文字のみで入力してください" }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナのみで入力してください" }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナのみで入力してください" }
  validates :birth_day, presence: true
end
