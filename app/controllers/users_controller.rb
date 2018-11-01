class UsersController < ApplicationController

	def top
        @words = Word.all
        @word = Word.last
        session[:user_id] = nil
        @user = User.new
        render :layout => 'login'
	end

  def create
    user = User.new(user_params)
      user.login_time = Time.now
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
           user.login_time = Time.now
           user.save
           session[:user_id] = user.id
           redirect_to reports_path
        else
            flash[:notice] = "名前かパスワードが間違っています。"
           redirect_to top_path
        end
	end

  def index
      @users = User.where(occupation_id: params[:id])
  end

	def show
		@user = User.find(params[:id])
    @relationship = Relationship.new
    @relationshipa = Relationship.find_by(followed_id: @user.id, follower_id: session[:user_id])
    @sub_report = SubReport.new
    @sub_reports = SubReport.where(user_id: @user.id)
    @report_values = ReportValue.where(user_id: @user.id, flag: true)
  end

  def show_image
    user = User.find(params[:id])
    send_data user.photo, :type => user.ctype, :disposition => "inline"
  end

  def update
    user = User.find(params[:id])
    if user.ctype != nil
      user.data(user_params[:image_id])
        if user.update(user_params)
          redirect_to user_path(user)
        else
          render plain: user.errors.full_messages[0]
        end
    else
      user.data(user_params[:image_id])
      user.update(user_params)
      redirect_to user_path(user)
    end
  end

  def destroy
    user = User.find(params[:id])
    user.update(flag: 1)
    redirect_to top_path
  end

  def followed
    relationship = Relationship.new(followed_id: params[:user_id], follower_id: session[:user_id])
    relationship.save
    redirect_to user_path(params[:user_id])
  end

  def follow_destroy
    relationship = Relationship.find_by(params[:id])
    relationship.destroy
    redirect_to user_path(params[:user_id])
  end

  def image_update
    user = User.find(params[:id])
    user.top = params[:user][:top]
    user.left = params[:user][:left]
    user.size = params[:user][:size]
    user.save
    redirect_to user_path(user.id)
  end

	private
    def user_params
      params.require(:user).permit(:name, :password, :occupation_id, :image_id, :flag, :login_time)
    end
    def relationship_params
      params.require(:relationship).permit(:followed_id,:follower_id)
    end
end
