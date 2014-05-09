class ContactType < ActiveRecord::Base
	validates :name, presence: true
end
