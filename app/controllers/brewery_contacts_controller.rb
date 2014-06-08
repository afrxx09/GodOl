class BreweryContactsController < ApplicationController
	
	def create
		@brewery = Brewery.find(params[:brewery_id])
		@brewery_contact = @brewery.brewery_contacts.create(brewery_contact_params)
		flash[:success] = "Kontaktuppgift sparad"
		redirect_to edit_brewery_path(@brewery)
	end
	
	def destroy
		@brewery = Brewery.find(params[:brewery_id])
		@brewery_contact = @brewery.brewery_contacts.find(params[:id])
		@brewery_contact.destroy
		flash[:success] = "Kontaktuppgiften har tagits bort"
		redirect_to edit_brewery_path(@brewery)
	end
	
	private
		def brewery_contact_params
			params.require(:brewery_contact).permit(:contact_type_id, :brewery_contact)
		end
		
end
