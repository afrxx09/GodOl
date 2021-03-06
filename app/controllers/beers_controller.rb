class BeersController < ApplicationController
	def index
		@beers = Beer.all
		@beer = Beer.new
	end
	
	def show
		@beer = Beer.find(params[:id])
	end
	
	def new
		@beer = Beer.new
	end
	
	def create
		@beer = Beer.new(beer_params)

		if @beer.save
			flash[:success] = @beer.name + " sparades"
			redirect_to beers_path
		else
			render 'new'
		end
	end
	
	def edit
		@beer = Beer.find(params[:id])
	end
	
	def update
		@beer = Beer.find(params[:id])

		if @beer.update(beer_params)
			flash[:success] = @beer.name + " uppdaterades"
			redirect_to beers_path
		else
			render 'edit'
		end
	end
	
	def destroy
		@beer = Beer.find(params[:id])
		@beer.destroy
		
		redirect_to beers_path
	end
	
	private
		def beer_params
			params.require(:beer).permit(:brewery_id, :beer_type_id, :name, :abv, :ibu, :ebc, :systembolaget, :img)
		end
end
