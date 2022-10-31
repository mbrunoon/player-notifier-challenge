class Player < ApplicationRecord

    include Methods    
    
    belongs_to :team        
    has_many :notifications, :dependent => :delete_all

    validates :name, presence: true

end