class Supporter::PlayersController < ApplicationController
  
  include Supporter

  before_action :set_player, only: %i[ show ]

  # GET /supporter/players or /supporter/players.json
  def index
    @players = Player.all
    respond_to do |format|
      format.html
      format.json {render json: @players }
    end
  end

  # GET /supporter/players/1 or /supporter/players/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @player }
    end
  end

  private

    def set_player
      @player = Player.find(params[:id])
    end
    
end
