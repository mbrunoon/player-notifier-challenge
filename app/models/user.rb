class User < ApplicationRecord    
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  enum role: %i[admin supporter]

  has_many :user_favorite_players, dependent: :destroy
  has_many :notifications, dependent: :destroy

  def favorite_players = user_favorite_players

  def generate_jwt
    JWT.encode({id: id, exp: 60.day.from_now.to_i}, ENV["DEVISE_JWT_SECRET_KEY"])
  end

end
