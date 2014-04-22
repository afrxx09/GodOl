class BreweryContact < ActiveRecord::Base
	belongs_to :brewery
	validates :brewery_id, presence: true
	has_one :contact_type
	validates :contact_type_id, presence: true
end
