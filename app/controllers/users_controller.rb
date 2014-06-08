class UsersController < ApplicationController
	
	before_action :signed_in_user, only: [:edit, :update, :destroy]
	before_action :correct_user,   only: [:edit, :update]
	before_action :admin_user,     only: :destroy
	
	def index
		@users = User.order(admin: :desc)
	end
	
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:welcome] = "Välkommen till god öl! Du kan nu logga in med dina uppgifter."
			redirect_to signin_path
		else
			render 'new'
		end
	end
	
	def edit
		@user = User.find(params[:id])
	end
	
	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
			flash[:success] = "Kontouppgifterna har sparats"
			render 'edit'
		else
			render 'edit'
		end
	end
	
	def destroy
		@user = User.find(params[:id])
		flash[:success] = "Användaren \"" + @user.name + "\" thar tagits bort"
		@user.destroy
		
		redirect_to users_path
	end
	
	def toggle_admin
		user = User.find(params[:id])
		user.toggle!(:admin)
		if user.admin
			flash[:success] = "Användaren " + user.name + " är nu admin."
		else
			flash[:success] = "Användaren " + user.name + " är inte längre admin."
		end
		redirect_to users_path
	end
	
	private
		
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
		end
		
		def correct_user
			@user = User.find(params[:id])
			redirect_to(beer_list_path) unless current_user?(@user)
		end
		
		def current_user
			remember_token = User.digest(cookies[:remember_token])
			@current_user ||= User.find_by(remember_token: remember_token)
		end
		
		def current_user?(user)
			user == current_user
		end
		
		def signed_in?
			!current_user.nil?
		end
		
		def signed_in_user
			unless signed_in?
				store_location
				redirect_to root_path
			end
		end
		
		def admin_user
			redirect_to(root_url) unless current_user.admin?
		end
		
end
