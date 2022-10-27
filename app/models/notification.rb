class Notification < ApplicationRecord
  
  belongs_to :player

  validates :message, presence: true

  default_scope { where(deleted_at: nil) }


end
