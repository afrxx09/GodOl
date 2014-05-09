class ContactTypesController < ApplicationController
	
	def index
		@contact_types = ContactType.all
	end
	
	def new
		@contact_type = ContactType.new
	end
	
	def create
		@contact_type = ContactType.new(contact_types_params)

		if @contact_type.save
			redirect_to contact_types_path
		else
			render 'new'
		end
	end
	
	def edit
		@contact_type = ContactType.find(params[:id])
	end
	
	def update
		@contact_type = ContactType.find(params[:id])

		if @contact_type.update(contact_types_params)
			redirect_to contact_types_path
		else
			render 'edit'
		end
	end
	
	def destroy
		@contact_type = ContactType.find(params[:id])
		@contact_type.destroy
		
		redirect_to contact_types_path
	end
	
	private
		def contact_types_params
			params.require(:contact_type).permit(:name)
		end
end
