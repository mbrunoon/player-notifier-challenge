module Supporter
    extend ActiveSupport::Concern    

    included do
        before_action :authenticate_user!
        before_action :check_user_role
        layout 'supporter'
    end    

    def check_user_role                
        if current_user.blank? || current_user.role != "supporter"    
            respond_to do |format|
                format.html{ redirect_to root_url, status: :unauthorized, notice: "unauthorized action" }
                format.json { render json: {}, status: :unauthorized }
            end            
        end
    end

end