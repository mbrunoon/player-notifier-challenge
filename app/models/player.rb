class Player < ApplicationRecord

    include Methods

    validates :name, presence: true
    

end