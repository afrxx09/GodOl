class Brewery < ActiveRecord::Base
	has_many :beers
	has_many :brewery_contacts
	
	validates :name, presence: true, length: { minimum: 2 }
	validates :nationality, presence: true
end
