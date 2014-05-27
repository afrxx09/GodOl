class LoggedBeer < ActiveRecord::Base
	belongs_to :user
	belongs_to :beer
	
	default_scope -> { order('created_at DESC') }
	
	validates :user_id, presence: true
	validates :beer_id, presence: true
end
