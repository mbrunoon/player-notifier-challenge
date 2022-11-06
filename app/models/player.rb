class Player < ApplicationRecord

    include Methods    
    
    belongs_to :team        
    has_many :notifications, :dependent => :destroy

    validates :name, presence: true

end