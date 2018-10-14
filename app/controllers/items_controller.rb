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
		if params[:search] == nil && params[:item] == nil
			@items = Item.all
        elsif params[:search] != nil
        	@items = Item.where(['name LIKE ?', "%#{params[:search]}%"])
        else
        	if params[:item][:genre_id] != "" and params[:item][:maker_id] != ""
        	  @items = Item.where("genre_id = ? and maker_id = ? ",params[:item][:genre_id] ,params[:item][:maker_id])
             else
        	  @items = Item.where("genre_id = ? or maker_id = ? ",params[:item][:genre_id] ,params[:item][:maker_id])
        	 end
        end
        @i = 1
        if @items.empty?
           @i = 0
        end
	end
end
