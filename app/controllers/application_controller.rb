class ApplicationController < ActionController::Base
	def admin_login_check
        if session[:admin_id] == nil
          flash[:notice] = "ログインしてください"
          redirect_to admins_top_path
        end
    end

    def user_login_check
        if session[:user_id] == nil
          flash[:notice] = "ログインしてください"
          redirect_to top_path
        end
    end
end
