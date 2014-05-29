class LoggedBeerEvaluation < ActiveRecord::Base
	belongs_to :logged_beer
	
	validates_numericality_of :body, less_than: 6
	validates_numericality_of :body, greater_than: 0
end
