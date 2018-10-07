class Admin::ItemsController < ApplicationController
	def new
		@item = Item.new
		@genre = Genre.new
		@maker = Maker.new
		@occupation = Occupation.new
		@items = Item.all
	end

	def create
		item = Item.new(item_params)
		item.save
		render json: "#{item.id}"
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
