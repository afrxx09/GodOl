class LoggedBeerScore < ActiveRecord::Base
	belongs_to :logged_beer
	
	validates :logged_beer_id, presence: true
end
