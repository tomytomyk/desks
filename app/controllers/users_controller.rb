class UsersController < ApplicationController

	def top
        session[:user_id] = nil
        @user = User.new
	end

	def create
		user = User.new(user_params)
		if user.save
		  session[:user_id] = user.id
		  redirect_to reports_path
    else
      redirect_to top_path
    end
	end

	def login
        if User.exists?(name: params[:name], password: params[:password], flag: 0)
           user = User.find_by(name: params[:name], password: params[:password])
           session[:user_id] = user.id
           redirect_to reports_path
        else
            flash[:notice] = "名前かパスワードが間違っています。"
           redirect_to top_path
        end
	end

	def show
		@user = User.find(params[:id])
    @report_value = ReportValue.new
  end

  def show_image
    user = User.find(params[:id])
    send_data user.photo, :type => user.ctype, :disposition => "inline"
  end

  def update
    user = User.find(params[:id])
    if item.ctype != nil
      user.data(user_params[:image_id])
        if user.update(user_params)
          redirect_to user_path(user)
        else
          render plain: user.errors.full_messages[0]
        end
    else
      user.update(user_params)
      redirect_to user_path(user)
    end
  end

  def destroy
    user = User.find(params[:id])
    user.update(flag: 1)
    redirect_to top_path
  end

  def follow
  end

  def follower
  end

	private
    def user_params
      params.require(:user).permit(:name, :password, :occupation_id, :image_id, :flag)
    end
end
