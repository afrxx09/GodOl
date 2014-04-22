class Brewery < ActiveRecord::Base
	has_many :brewery_contacts, dependent: :destroy
end
