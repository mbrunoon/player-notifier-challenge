class Admin::PlayersController < ApplicationController

  include Admin

  before_action :set_player, only: %i[ show edit update destroy ]

  # GET /players or /players.json
  def index
    @players = Player.all.page get_page
    
    respond_to do |format|
      format.html
      format.json { render json: { 
          current_page: @players.current_page, 
          total_pages: @players.total_pages,
          players: @players } 
      }
    end
  end

  # GET /players/1 or /players/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @player }
    end    
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players or /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to admin_player_url(@player), notice: "Player was successfully created." }
        format.json { render json: @player, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1 or /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to admin_player_url(@player), notice: "Player was successfully updated." }
        format.json { render json: @player, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1 or /players/1.json
  def destroy
    @player.destroy

    respond_to do |format|
      format.html { redirect_to admin_players_url, notice: "Player was successfully destroyed." }
      format.json { head :no_content }
    end
  rescue
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def player_params
      params.require(:player).permit(:name, :number, :nationality, :birthdate, :position, :team_id)
    end

    def get_page
      params[:page] || 1
    end

end
