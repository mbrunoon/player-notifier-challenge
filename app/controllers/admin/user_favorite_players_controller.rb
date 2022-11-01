class Admin::UserFavoritePlayersController < ApplicationController

  include Admin

  before_action :set_user_favorite_player, only: %i[ show edit update destroy ]

  def index
    @favorite_players = UserFavoritePlayer.all
    respond_to do |format|
      format.html
      format.json { render json: @favorite_players }
    end
  end
  
  def show
    respond_to do |format|
      format.html
      format.json { render json: @favorite_player }
    end    
  end

  def new
    @favorite_player = UserFavoritePlayer.new
  end

  def edit
  end

  def create
    @favorite_player = UserFavoritePlayer.new(user_favorite_player_params)

    respond_to do |format|
      if @favorite_player.save
        format.html { redirect_to user_favorite_player_url(@favorite_player), notice: "User favorite player was successfully created." }
        format.json { render json: @favorite_player, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favorite_player.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @favorite_player.update(user_favorite_player_params)
        format.html { redirect_to user_favorite_player_url(@favorite_player), notice: "User favorite player was successfully updated." }
        format.json { render json: @favorite_player, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @favorite_player.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @favorite_player.destroy

    respond_to do |format|
      format.html { redirect_to user_favorite_players_url, notice: "User favorite player was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_user_favorite_player
      @favorite_player = UserFavoritePlayer.find(params[:id])
    end

    def user_favorite_player_params
      params.require(:user_favorite_player).permit(:user_id, :player_id)
    end

end
