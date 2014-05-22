class StaticPagesController < ApplicationController
	def start
	end

	def contact
	end

	def beer_list
		@beers = Beer.all
	end

	def brewery_list
		@breweries = Brewery.all
	end
end
