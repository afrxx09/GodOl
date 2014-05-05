class BeerTypesController < ApplicationController
	def index
		@beer_types = BeerType.all
	end
	
	def show
		@beer_type = BeerType.find(params[:id])
	end
	
	def new
		@beer_type = BeerType.new
	end
	
	def create
		@beer_type = BeerType.new(beer_type_params)

		if @beer_type.save
			redirect_to @beer_type
		else
			render 'new'
		end
	end
	
	def edit
		@beer_type = BeerType.find(params[:id])
	end
	
	def update
		@beer_type = BeerType.new(beer_type_params)

		if @beer_type.update
			redirect_to @beer_type
		else
			render 'edit'
		end
	end
	
	def destroy
		@beer_type = BeerType.find(params[:id])
		@beer_type.destroy
	end
	
	private
		def beer_type_params
			params.require(:beer_type).permit(:name)
		end
end
