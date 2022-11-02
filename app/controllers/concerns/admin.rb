module Admin
    extend ActiveSupport::Concern

    included do        
        before_action :authenticate_user!
        before_action :check_user_role
        layout 'admin'                   
    end


    def check_user_role                
        if current_user.role != "admin"    
            respond_to do |format|
                format.html{ redirect_to root_page, status: unauthorized, notice: "unauthorized action" }
                format.json { render json: {}, status: :unauthorized }
            end            
        end
    end

end