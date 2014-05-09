class Brewery < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 2 }
	validates :nationality, presence: true
end
