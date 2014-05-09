class ContactType < ActiveRecord::Base
	has_many :brewery_contacts
	
	validates :name, presence: true
end
