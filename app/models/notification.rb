class Notification < ApplicationRecord  

  belongs_to :player
  belongs_to :user

  validates :message, presence: true

  default_scope { where(deleted_at: nil) }


  def mark_as_read_by_player
    return false if !read_at.blank?
    self.update(read_at: DateTime.now)
    UserNotifierMailer.send_player_read_notification(self).deliver_later
  end

end
