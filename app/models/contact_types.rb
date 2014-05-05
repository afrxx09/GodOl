class ContactTypes < ActiveRecord::Base
	validates(:name, presence: true)
end
