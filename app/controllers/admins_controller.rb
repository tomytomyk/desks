class AdminsController < ApplicationController

  before_action :admin_login_check, except: [:top, :login]


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
        @language = Language.new
        @languages = Language.all
        @occupation = Occupation.new
        @occupations = Occupation.all
    end

    def other
        @genres = Genre.all
        @makers = Maker.all
        @occupations = Occupation.all
    end

    def language_create
        language = Language.new(language_params)
        language.save
        redirect_to admins_index_path
    end

    def occupation_create
        occupation = Occupation.new(occupation_params)
        occupation.save
        redirect_to admins_index_path
    end

    def language_edit
        @language = Language.find(params[:id])
    end

    def occupation_edit
        @occupation = Occupation.find(params[:id])
    end

    def language_update
        language = Language.find(params[:id])
        language.update(language_params)
        @languages = Language.all
    end

    def occupation_update
        occupation = Occupation.find(params[:id])
        occupation.update(occupation_params)
        @occupations = Occupation.all
    end

    def language_destroy
        language = Language.find(params[:id])
        language.destroy
        redirect_to admins_index_path
    end

    def occupation_destroy
        occupation = Occupation.find(params[:id])
        occupation.destroy
        redirect_to admins_index_path
    end
    private
    def admin_params
      params.require(:admin).permit(:name, :password)
    end
    def language_params
      params.require(:language).permit(:name)
    end
    def occupation_params
      params.require(:occupation).permit(:name)
    end
end