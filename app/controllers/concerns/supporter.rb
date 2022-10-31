module Supporter
    extend ActiveSupport::Concern    

    included do
        before_action :authenticate_user!
        layout 'supporter'
    end    

end