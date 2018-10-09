class Admin::ItemsController < ApplicationController

	before_action :admin_login_check

	def new
		@item = Item.new
		@items = Item.all
		@genre = Genre.new
		@genres = Genre.all
		@maker = Maker.new
		@makers = Maker.all
		@occupation = Occupation.new
		@occupations = Occupation.all
	end

	def create
		item = Item.new(item_params)
		item.save
		render json: "#{item.id}"
	end

	def destroy
		item = Item.find(params[:id])
		item.destroy
		redirect_to new_admin_item_path
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		item = Item.find(params[:id])
		item.update(item_params)
	end

	def index

	end

	def genre_create
		genre = Genre.new(genre_params)
		genre.save
		redirect_to new_admin_item_path
	end

	def maker_create
		maker = Maker.new(maker_params)
		maker.save
		redirect_to new_admin_item_path
	end

    def occupation_create
    	occupation = Occupation.new(occupation_params)
		occupation.save
		redirect_to new_admin_item_path
    end

    def genre_edit
    end

    def maker_edit
    end

    def occupation_edit
    end

    def genre_destroy
    	genre = Genre.find(params[:id])
    	genre.destroy
    	redirect_to new_admin_item_path
    end

    def maker_destroy
    	maker = Maker.find(params[:id])
    	maker.destroy
    	redirect_to new_admin_item_path
    end

    def occupation_destroy
    	occupation = Occupation.find(params[:id])
    	occupation.destroy
    	redirect_to new_admin_item_path
    end

    private
    def item_params
    	params.require(:item).permit(:name, :image_id, :price, :maker_id, :genre_id)
    end

    def genre_params
    	params.require(:genre).permit(:name)
    end

    def maker_params
    	params.require(:maker).permit(:name, :maker_url)
    end

    def occupation_params
    	params.require(:occupation).permit(:name)
    end
end
