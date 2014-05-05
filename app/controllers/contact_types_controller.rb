class ContactTypesController < ApplicationController
	
	def index
		@contact_types = ContactTypes.all
	end
	
	def show
		@contact_type = ContactTypes.find(params[:id])
	end
	
	def new
		@contact_type = ContactTypes.new
	end
	
	def create
		@contact_type = ContactTypes.new(contact_type_params)

		if @contact_type.save
			redirect_to @contact_type
		else
			render 'new'
		end
	end
	
	def edit
		@contact_type = ContactTypes.find(params[:id])
	end
	
	def update
		@contact_type = ContactTypes.new(contact_type_params)

		if @contact_type.update
			redirect_to @contact_type
		else
			render 'edit'
		end
	end
	
	def destroy
		@contact_type = ContactTypes.find(params[:id])
		@contact_type.destroy
	end
	
	private
		def contact_type_params
			params.require(:contact_types).permit(:name)
		end
end
