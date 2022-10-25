class Notification < ApplicationRecord
  
  belongs_to :player

  validates :message, presence: true

end
