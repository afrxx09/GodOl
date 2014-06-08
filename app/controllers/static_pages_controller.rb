class StaticPagesController < ApplicationController
	def start
		@new_beers = Beer.order(created_at: :desc).limit(5)
		@popular_beers = Beer.order(created_at: :asc).limit(5)
	end

	def contact
	end

	def beer_list
		
		@beers = Beer.all.order(name: :asc)
		@beers = @beers.search(params[:search]) if !params[:search].blank?
		@beers = @beers.filter_country(params[:country]) if !params[:country].blank?
		@beers = @beers.filter_beer_type(params[:beer_type]) if !params[:beer_type].blank?

	end

	def brewery_list
		
		@breweries = Brewery.all.order(name: :asc)
		@breweries = @breweries.search(params[:search]) if !params[:search].blank?
		@breweries = @breweries.filter_country(params[:country]) if !params[:country].blank?
		
	end
	
	def beer_me
		beer_type = params[:beer_type]
		abv = params[:abv].split(',')
		abv_min = abv[0]
		abv_max = abv[1]
		
		if params[:ibu].blank?
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
