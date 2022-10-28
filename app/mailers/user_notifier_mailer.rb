class UserNotifierMailer < ApplicationMailer

    def send_player_read_notification(notification)
        @notification = notification
        mail(
            :to => @notification.user.email,
            :subject => "#{@notification.player.name} read your message"
         )
    end

end
