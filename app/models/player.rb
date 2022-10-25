class Player < ApplicationRecord

    include Methods

    validates :name, presence: true
    
    belongs_to :team

end