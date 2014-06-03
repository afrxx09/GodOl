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
		beer_type = params[:beer_type]
		abv = params[:abv].split(',')
		abv_min = abv[0]
		abv_max = abv[1]
		
		if params[:ibu].empty?
			@beers = Beer.beer_me(beer_type, abv_min, abv_max)
		else
			ibu = params[:ibu].split(',')
			ibu_min = ibu[0]
			ibu_max = ibu[1]
			flash[:notice] = ibu_max
			@beers = Beer.beer_me_ibu(beer_type, abv_min, abv_max, ibu_min, ibu_max)
			
		end
		
	end
end
