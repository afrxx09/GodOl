class BeerType < ActiveRecord::Base
	validates :name, presence: true
end
