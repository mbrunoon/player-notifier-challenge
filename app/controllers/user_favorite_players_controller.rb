class UserFavoritePlayersController < ApplicationController
  before_action :set_user_favorite_player, only: %i[ show edit update destroy ]

  # GET /user_favorite_players or /user_favorite_players.json
  def index
    @user_favorite_players = UserFavoritePlayer.all
  end

  # GET /user_favorite_players/1 or /user_favorite_players/1.json
  def show
  end

  # GET /user_favorite_players/new
  def new
    @user_favorite_player = UserFavoritePlayer.new
  end

  # GET /user_favorite_players/1/edit
  def edit
  end

  # POST /user_favorite_players or /user_favorite_players.json
  def create
    @user_favorite_player = UserFavoritePlayer.new(user_favorite_player_params)

    respond_to do |format|
      if @user_favorite_player.save
        format.html { redirect_to user_favorite_player_url(@user_favorite_player), notice: "User favorite player was successfully created." }
        format.json { render :show, status: :created, location: @user_favorite_player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_favorite_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_favorite_players/1 or /user_favorite_players/1.json
  def update
    respond_to do |format|
      if @user_favorite_player.update(user_favorite_player_params)
        format.html { redirect_to user_favorite_player_url(@user_favorite_player), notice: "User favorite player was successfully updated." }
        format.json { render :show, status: :ok, location: @user_favorite_player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_favorite_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_favorite_players/1 or /user_favorite_players/1.json
  def destroy
    @user_favorite_player.destroy

    respond_to do |format|
      format.html { redirect_to user_favorite_players_url, notice: "User favorite player was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_favorite_player
      @user_favorite_player = UserFavoritePlayer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_favorite_player_params
      params.require(:user_favorite_player).permit(:user_id, :player_id)
    end
end
