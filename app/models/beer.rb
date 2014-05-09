class Beer < ActiveRecord::Base
	belongs_to :beer_type
	belongs_to :brewery
	validates :brewery_id, presence: true
	validates_numericality_of :brewery_id, :greater_than => 0
	
	validates :beer_type_id, presence: true
	validates_numericality_of :beer_type_id, :greater_than => 0
	
	validates :name, presence: true
end
