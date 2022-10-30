class Supporter::UserFavoritePlayersController < ApplicationController
  
  include Supporter
    
  before_action :set_user_favorite_player, only: %i[ destroy ]

  # GET /supporter/user_favorite_players or /supporter/user_favorite_players.json
  def index
    @user_favorite_players = current_user.favorite_players
    respond_to do |format|
      format.json { render json: @user_favorite_players }
    end
  end  

  # POST /supporter/ufavorite_players or /supporter/favorite_players.json
  def create
    @user_favorite_player = current_user.favorite_players.build(set_favorite_player_params)

    respond_to do |format|
      if @user_favorite_player.save
        format.json { render json: @user_favorite_player, status: :created }
      else
        format.json { render json: @user_favorite_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supporter/favorite_players/1 or /supporter/favorite_players/1.json
  def destroy
    @user_favorite_player.destroy
    respond_to do |format|      
      format.json { head :no_content }
    end
  end

  private    

    def set_user_favorite_player
      @user_favorite_player = UserFavoritePlayer.find(params[:id])
    end

    def set_favorite_player_params
      params.require(:user_favorite_player).permit(:player_id)
    end

end
