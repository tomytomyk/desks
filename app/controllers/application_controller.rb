class ApplicationController < ActionController::Base
	  def admin_login_check
        if session[:admin_id] == nil
          redirect_to admins_top_path
        end
    end
end
