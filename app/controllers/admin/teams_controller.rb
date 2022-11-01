class Admin::TeamsController < ApplicationController
  
  include Admin
  
  before_action :set_team, only: %i[ show edit update destroy ]
  
  def index
    @teams = Team.all
    respond_to do |format|
      format.html
      format.json { render json: @teams }
    end
  end
  
  def show
    respond_to do |format|
      format.html
      format.json { render json: @team }
    end    
  end
  
  def new
    @team = Team.new
  end
  
  def edit
  end
  
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to admin_team_url(@team), notice: "Team was successfully created." }
        format.json { render json: @team, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to admin_team_url(@team), notice: "Team was successfully updated." }
        format.json { render json: @team, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @team.destroy

    respond_to do |format|
      format.html { redirect_to admin_teams_url, notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_team
      @team = Team.find(params[:id])
    end
    
    def team_params
      params.require(:team).permit(:name, :acronym)
    end
end
