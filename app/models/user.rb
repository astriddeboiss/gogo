class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :trips
  has_many :user_preferences
  has_many :categories, through: :user_preferences
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
