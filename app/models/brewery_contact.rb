class BreweryContact < ActiveRecord::Base
	belongs_to :brewery
	belongs_to :contact_type
end
