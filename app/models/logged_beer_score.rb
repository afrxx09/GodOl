class LoggedBeerScore < ActiveRecord::Base
	belongs_to :logged_beer
	
	validates :aroma, presence: true
	validates :appearance, presence: true
	validates :flavour, presence: true
	validates :pallate, presence: true
	validates :overall, presence: true
	
	validates_numericality_of :aroma, less_than: 6
	validates_numericality_of :aroma, greater_than: 0
	
	validates_numericality_of :appearance, less_than: 6
	validates_numericality_of :appearance, greater_than: 0
	
	validates_numericality_of :flavour, less_than: 6
	validates_numericality_of :flavour, greater_than: 0
	
	validates_numericality_of :pallate, less_than: 6
	validates_numericality_of :pallate, greater_than: 0
	
	validates_numericality_of :overall, less_than: 6
	validates_numericality_of :overall, greater_than: 0
end
