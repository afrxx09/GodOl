class BreweryContact < ActiveRecord::Base
	belongs_to :brewery
	belongs_to :contact_type
	
	validates :brewery_contact, presence: true, length: { minimum: 2, message: "En kontakt får inte vara tom." }
end
