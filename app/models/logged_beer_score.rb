class LoggedBeerScore < ActiveRecord::Base
	belongs_to :logged_beer
	
	validates :aroma, presence: true
	validates :appearance, presence: true
	validates :flavour, presence: true
	validates :pallate, presence: true
	validates :overall, presence: true
	
	validates_numericality_of :aroma, less_than: 6, :message => "Betyg för arom saknas"
	validates_numericality_of :aroma, greater_than: 0, :message => "Betyg för arom saknas"
	
	validates_numericality_of :appearance, less_than: 6, :message => "Betyg för utseende saknas"
	validates_numericality_of :appearance, greater_than: 0, :message => "Betyg för utseende saknas"
	
	validates_numericality_of :flavour, less_than: 6, :message => "Betyg för smak saknas"
	validates_numericality_of :flavour, greater_than: 0, :message => "Betyg för smak saknas"
	
	validates_numericality_of :pallate, less_than: 6, :message => "Betyg för munkänsla saknas"
	validates_numericality_of :pallate, greater_than: 0, :message => "Betyg för munkänsla saknas"
	
	validates_numericality_of :overall, less_than: 6, :message => "Generellt betyg saknas"
	validates_numericality_of :overall, greater_than: 0, :message => "Generellt betyg saknas"
end
