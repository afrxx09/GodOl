class BreweriesController < ApplicationController
	def index
		@breweries = Brewery.all
	end
	
	def show
		@brewery = Brewery.find(params[:id])
		@brewery_contacts = BreweryContact.find_by(brewery_id: @brewery.id)
	end
	
	def new
		@brewery = Brewery.new
	end
	
	def create
		@brewery = Brewery.new(brewery_params)

		if @brewery.save
			redirect_to brewery_path(@brewery)
		else
			render 'new'
		end
	end
	
	def edit
		@brewery = Brewery.find(params[:id])
	end
	
	def update
		@brewery = Brewery.find(params[:id])

		if @brewery.update(brewery_params)
			redirect_to brewery_path(@brewery)
		else
			render 'edit'
		end
	end
	
	def destroy
		@brewery = Brewery.find(params[:id])
		@brewery.destroy
		
		redirect_to breweries_path
	end
	
	private
		def brewery_params
			params.require(:brewery).permit(:name, :address, :address2, :city, :state, :zip, :nationality, :description)
		end
end
