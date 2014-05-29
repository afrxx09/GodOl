class LoggedBeersController < ApplicationController
	
	before_action :signed_in_user, only: [:show, :new, :create, :destroy]
	
	def index
		@logged_beers = LoggedBeer.where('user_id = ?', current_user.id)
	end
	
	def show
		@logged_beer = LoggedBeer.find(params[:id])
	end
	
	def new
		@logged_beer = LoggedBeer.new(:beer_id => params[:id])
		@logged_beer.build_logged_beer_score
		@logged_beer.build_logged_beer_evaluation
	end
	
	def create
		@logged_beer = LoggedBeer.new(logged_beer_params)
		@logged_beer.user_id = current_user.id
		@beer = Beer.find(@logged_beer.beer_id)
		
		if @beer
			if @logged_beer.save
				redirect_to logged_beers_path
			else
				redirect_to beer_list_path
			end
		else
			redirect_to beer_list_path
		end
		
	end
	
	def destroy
		
	end
	
	private
		def logged_beer_params
			params.require(:logged_beer).permit(
				:beer_id,
				logged_beer_score_attributes: [
					:appearance, :aroma, :pallate,
					:flavour, :overall
				],
				logged_beer_evaluation_attributes: [
					:body, :linger, :bitter,
					:sour, :sweet, :fruity,
					:floral, :hoppy, :spicy,
					:malty, :toffee, :burnt,
					:chocolate, :sulphury, :carbonation
				]
			)
		end
	
end
