class SessionsController < ApplicationController
	def new
		
	end
	
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to logged_beers_path
		else
			flash[:warning] = "Kunde inte logga in, kontrollera användarnamn och lösenord."
			redirect_to signin_path
		end
	end
	
	def destroy
		sign_out
		flash[:success] = "Du har loggats ut."
		redirect_to root_url
	end
end
