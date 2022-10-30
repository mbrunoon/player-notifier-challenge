class Supporter::NotificationsController < ApplicationController

  include Supporter

  # GET /supporter/notifications or /supporter/notifications.json
  def index
    @supporter_notifications = current_user.notifications
    respond_to do |format|
      format.html
      format.json { render json: @supporter_notifications }
    end
  end  

  # GET /supporter/notifications/new
  def new
    @supporter_notification = current_user.notifications.build
  end  

  # POST /supporter/notifications or /supporter/notifications.json
  def create
    @supporter_notification = current_user.notifications.build(notification_params)

    respond_to do |format|
      if @supporter_notification.save
        format.html { redirect_to supporter_notifications_url(current_user), notice: "Notification was successfully created." }
        format.json { render json: @supporter_notification, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @supporter_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  private    
    
    def notification_params
      params.require(:notification).permit(:player_id, :message)
    end

end
