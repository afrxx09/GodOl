class Beer < ActiveRecord::Base
	has_many :logged_beers
	
	belongs_to :beer_type
	belongs_to :brewery
	
	validates :brewery_id, presence: true
	validates_numericality_of :brewery_id, :greater_than => 0
	
	validates :beer_type_id, presence: true
	validates_numericality_of :beer_type_id, :greater_than => 0
	
	validates :name, presence: true
	
	has_attached_file :img, :default_url => "/images/beer-no-image.png"
	validates_attachment_content_type :img, :content_type => ['image/jpeg', 'image/png']
	
	def self.search(query)
		joins(:brewery).where("beers.name LIKE ? OR breweries.name LIKE ? OR beers.systembolaget = ?", "%#{query}%", "%#{query}%", "#{query}")
	end
	
	def self.filter(query)
		joins(:brewery).where("breweries.nationality = ?", "#{query}")
	end
	
	def self.beer_me(beer_type, abv_min, abv_max)
		where("beer_type_id = ? AND abv BETWEEN ? AND ?", "#{beer_type}", "#{abv_min}", "#{abv_max}").limit(5).order("RANDOM()")
	end
	def self.beer_me_ibu(beer_type, abv_min, abv_max, ibu_min, ibu_max)
		where("beer_type_id = ? AND abv BETWEEN ? AND ? AND ibu BETWEEN ? AND ?", "#{beer_type}", "#{abv_min}", "#{abv_max}", "#{ibu_min}", "#{ibu_max}").limit(5).order("RANDOM()")
	end
end
