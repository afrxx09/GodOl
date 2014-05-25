class Brewery < ActiveRecord::Base
	has_many :beers
	has_many :brewery_contacts
	
	validates :name, presence: true, length: { minimum: 2 }
	validates :nationality, presence: true
	
	has_attached_file :img, :default_url => "/images/brewery-no-image.jpg"
	validates_attachment_content_type :img, :content_type => ['image/jpeg', 'image/png']
	
	def self.search(query)
		where("name LIKE ? OR city LIKE ? OR nationality LIKE ? OR state LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
	end
	
	def self.filter(query)
		where("nationality = ?", "#{query}")
	end
end
