class BreweryContactsController < ApplicationController
	
	def create
		@brewery = Brewery.find(params[:brewery_id])
		@brewery_contact = @brewery.brewery_contacts.create(brewery_contact_params)
		redirect_to brewery_path(@brewery)
	end
	
	def destroy
		@brewery = Brewery.find(params[:brewery_id])
		@brewery_contact = @brewery.brewery_contacts.find(params[:id])
		@brewery_contact.destroy
		redirect_to brewery_path(@brewery)
	end
	
	private
		def brewery_contact_params
			params.require(:brewery_contact).permit(:contact_type_id, :brewery_contact)
		end
		
end