class AdminsController < ApplicationController

  before_action :admin_login_check, only: [:index, :other]


	def top
        session[:admin_id] = nil
	end

	def login
        if Admin.exists?(name: params[:name], password: params[:password])
           admin = Admin.find_by(name: params[:name], password: params[:password])
           session[:admin_id] = admin.id
           redirect_to admins_index_path
        else
           flash[:notice] = "名前かパスワードが違います。"
           redirect_to admins_top_path
        end
    end

    def index
        @admin = Admin.find_by(id:session[:admin_id])
    end

    def other
        @genres = Genre.all
        @makers = Maker.all
        @occupations = Occupation.all
    end

    private
    def admin_params
      params.require(:admin).permit(:name, :password)
    end
end