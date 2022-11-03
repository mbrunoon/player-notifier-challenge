class ApplicationController < ActionController::Base

    protect_from_forgery    

    private

    def after_sign_in_path_for(user)
      redirect_to user_redirect_by_role(user.role)
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
        return if @current_user_id.blank?
        @current_user ||= super || User.find(@current_user_id)
    end

    def signed_in?
        @current_user_id.present?
    end    

    def user_redirect_by_role(role)
      redirect_url = {
        "admin" => admin_root_path,
        "supporter" => supporter_root_path
      }
      return redirect_url[role]
    end

end
