class StaticPagesController < ApplicationController
	def start
		@new_beers = Beer.order(created_at: :desc).limit(5)
		@popular_beers = Beer.order(created_at: :asc).limit(5)
	end

	def contact
	end

	def beer_list
		if params[:search]
			@beers = Beer.search(params[:search])
		else
			if params[:filter]
				@beers = Beer.filter(params[:filter])
			else
				@beers = Beer.all.order(name: :asc)
			end	
		end
	end

	def brewery_list
		if params[:search]
			@breweries = Brewery.search(params[:search])
		else
			if params[:filter]
				@breweries = Brewery.filter(params[:filter])
			else
				@breweries = Brewery.all.order(name: :asc)
			end	
		end
	end
	
	def beer_me
		if params[:beer_type]
			@beers = Beer.beer_me(params[:beer_type])
		end
	end
end
