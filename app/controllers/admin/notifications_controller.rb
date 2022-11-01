class Admin::NotificationsController < ApplicationController
  before_action :set_notification, only: %i[ show edit update destroy ]  

  def index
    @notifications = Notification.all
    respond_to do |format|
      format.html
      format.json { render json: @notifications }
    end
  end
  
  def show
    respond_to do |format|
      format.html
      format.json { render json: @notification }
    end    
  end
  
  def new
    @notification = Notification.new
  end
  
  def edit
  end

  def create
    @notification = current_user.notifications.build(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to admin_notification_url(@notification), notice: "Notification was successfully created." }
        format.json { render json: @notification, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to admin_notification_url(@notification), notice: "Notification was successfully updated." }
        format.json { render json: @notification, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @notification.destroy

    respond_to do |format|
      format.html { redirect_to admin_notifications_url, notice: "Notification was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_notification
      @notification = Notification.find(params[:id])
    end
    
    def notification_params
      params.require(:notification).permit(:player_id, :message)
    end
end
