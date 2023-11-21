class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  varidates :nickname, presence: true
  varidates :first_name, presence: true
  varidates :last_name, presence: true
  varidates :first_name_kana, presence: true
  varidates :last_name_kana, presence: true
  varidates :birth_day, presence: true
end
