class Admin::UsersController < ApplicationController

	before_action :admin_login_check

	def index
		@users = User.all
	end
	def change_user
		user = User.find(params[:id])
		if user.flag == 0
		  user.flag = 1
		  user.save
		  redirect_to admin_users_path
	    else user.flag == 1
		  user.flag = 0
		  user.save
		  redirect_to admin_users_path
	    end
	end
	private
    def user_params
      params.require(:user).permit(:name, :password, :occupation_id, :image_id, :flag, :ctype, :photo)
    end
end
