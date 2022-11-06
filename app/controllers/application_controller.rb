class ApplicationController < ActionController::Base

    protect_from_forgery    

    private

    def after_sign_in_path_for(user)
      redirect_to root_path
    end

    def authenticate_user!
        if request.headers['Authorization'].present?
          authenticate_or_request_with_http_token do |token|
            begin
              jwt_payload = JWT.decode(token, ENV["DEVISE_JWT_SECRET_KEY"]).first
    
              @current_user_id = jwt_payload['id']
            rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
              head :unauthorized
            end
          end
        end
    end    

    def current_user
        @current_user ||= super || User.find(@current_user_id)        
    rescue => e
      nil      
    end

    def signed_in?
        @current_user_id.present?
    end        

end
