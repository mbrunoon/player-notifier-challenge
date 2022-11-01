module Admin
    extend ActiveSupport::Concern

    included do        
        before_action :authenticate_user!
        layout 'admin'        
    end

end