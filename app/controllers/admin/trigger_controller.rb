class Admin::TriggerController < ApplicationController

    include Admin

    def notification
        notification = get_notification        
        respond_to do |format|
            if notification.blank?
                format.json{ render json: notification, status: :not_found  }
            else
                notification.mark_as_read_by_player
                format.json{ render json: notification, status: :ok  }
            end            
        end
    end

    private

        def get_notification
            Notification.find(params[:id])
        end

end
