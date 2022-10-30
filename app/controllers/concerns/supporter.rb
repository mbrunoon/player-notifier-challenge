module Supporter
    extend ActiveSupport::Concern

    included do
        layout 'supporter'
    end    

end