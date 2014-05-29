class LoggedBeer < ActiveRecord::Base
	belongs_to :user
	belongs_to :beer
	
	has_one :logged_beer_score
	has_one :logged_beer_evaluation
	
	accepts_nested_attributes_for :logged_beer_score, :logged_beer_evaluation
	
	default_scope -> { order('created_at DESC') }
end
