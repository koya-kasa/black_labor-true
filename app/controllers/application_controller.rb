class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :login_required
    
    private
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def login_required
        redirect_to login_path, notice: 'ログインしてください' unless current_user
    end
    
    def already_login
        redirect_to admin_user_path(@current_user), notice: 'ログイン済みです' if current_user
    end
end
