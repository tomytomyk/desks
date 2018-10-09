class UsersController < ApplicationController

	def top
        session[:user_id] = nil
        @user = User.new
	end

	def create
		user = User.new(user_params)
		user.save
		session[:user_id] = user.id
		redirect_to reports_path
	end

	def login
        if User.exists?(name: params[:name], password: params[:password])
           user = User.find_by(name: params[:name], password: params[:password])
           session[:user_id] = user.id
           redirect_to reports_path
        else
           flash[:notice] = "名前かパスワードが違います。"
           redirect_to top_path
        end
	end

	private
    def user_params
      params.require(:user).permit(:name, :password, :occupation_id, :image_id)
    end
end
