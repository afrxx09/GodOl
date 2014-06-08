class Brewery < ActiveRecord::Base
	has_many :beers
	has_many :brewery_contacts
	
	validates :name, presence: {message: "Måste ange namn för bryggeriet"}, length: { minimum: 2, message: "Måste bestå av minst 2 tecken"}
	validates :nationality, presence: { message: "En kontakt får inte vara tom." }
	
	has_attached_file :img, :default_url => "/images/brewery-no-image.jpg"
	validates_attachment_content_type :img, :content_type => ['image/jpeg', 'image/png']
	
	def self.search(query)
		where("name LIKE ? OR city LIKE ? OR nationality LIKE ? OR state LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
	end
	
	def self.filter_country(query)
		where("nationality = ?", "#{query}")
	end
end
