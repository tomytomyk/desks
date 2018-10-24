class LanguageController < ApplicationController

	def show
		@language = Language.find(params[:id])
	end
	private
	def language_params
    	params.require(:language).permit(:name)
    end
end
