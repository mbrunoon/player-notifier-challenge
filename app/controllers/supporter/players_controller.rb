class Supporter::PlayersController < ApplicationController
  
  include Supporter

  before_action :set_player, only: %i[ show ]

  # GET /supporter/players or /supporter/players.json
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

    def get_page
      params[:page] || 1
    end
    
end
