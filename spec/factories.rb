FactoryGirl.define do
	
	factory :brewery do
		name "Brewry"
		address "Street 123"
		address2 "c/o A Place"
		city "A town"
		state "CA"
		zip "12345"
		nationality "USA"
		description "A brewery in a city in CA."
		
		factory :brewery_with_beer do
			after_create do |brewery|
				create(:beer, brewery: brewery)
			end
		end
	end
	
	factory :beer do
		name "Test Beer"
		brewery
		beer_type
	end
	
	factory :beer_type do
		name "Ale"
	end
	
end