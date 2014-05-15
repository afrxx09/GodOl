class BeerTypesController < ApplicationController
	
	def index
		@beer_types = BeerType.all
		@beer_type = BeerType.new
	end
	
	def create
		@beer_type = BeerType.new(beer_type_params)

		if @beer_type.save
			redirect_to beer_types_path
		else
			render 'index'
		end
	end
	
	def destroy
		@beer_type = BeerType.find(params[:id])
		@beer_type.destroy
		
		redirect_to beer_types_path
	end
	
	private
		def beer_type_params
			params.require(:beer_type).permit(:name)
		end
end
