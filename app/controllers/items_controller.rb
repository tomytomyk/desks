class ItemsController < ApplicationController

	def show
		@item = Item.find(params[:id])
		t = Time.now
		if t - @item.updated_at >= 10
		   @item.count += 1
		   @item.save
	    end
	end

	def index
	    @items = Item.all
	end
end
