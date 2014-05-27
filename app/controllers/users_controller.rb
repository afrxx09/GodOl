class UsersController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update]
	before_action :correct_user,   only: [:edit, :update]
	before_action :admin_user,     only: [:index, :destroy, :edit, :update, :destroy]
	
	def index
		@users = User.order(admin: :desc)
	end
	
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path
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
			redirect_to root_path
		else
			render 'edit'
		end
	end
	
	def destroy
		@user = User.find(params[:id])
		@user.destroy
		
		redirect_to users_path
	end
	
	def toggle_admin
		user = User.find(params[:id])
		user.toggle!(:admin)
		redirect_to users_path
	end
	
	private
		
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
		end
		
		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_url) unless current_user?(@user)
		end
		
		def admin_user
			redirect_to(root_url) unless current_user.admin?
		end
		
end
