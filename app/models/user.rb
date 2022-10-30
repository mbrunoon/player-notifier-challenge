class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[admin supporter]

  has_many :user_favorite_players, dependent: :destroy
  has_many :notifications, dependent: :destroy

  def favorite_players = user_favorite_players

end
