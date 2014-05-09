require 'spec_helper'

describe Beer do
	
	before do 
		@beer = Beer.new(
			brewery_id: 1,
			beer_type_id: 1,
			name: "Ett öl",
			abv: 5.2,
			ibu: 50,
			ebc: 40
		)
	end
	
	subject { @beer }
	
	it { should respond_to(:brewery_id) }
	it { should respond_to(:beer_type_id) }
	it { should respond_to(:name) }
	it { should respond_to(:abv) }
	it { should respond_to(:ibu) }
	it { should respond_to(:ebc) }
	it { should be_valid }
	
	
	describe "Minimal but still valid Beer object" do
		before do
			@beer = Beer.new(
				brewery_id: 1,
				beer_type_id: 1,
				name: "Ett öl"
			)
		end
		it { should be_valid }
	end
	
	describe "Beer with missing required fields" do
		
		describe "Missing brewery_id" do 
			before { @beer.brewery_id = nil }
			it {should_not be_valid}
		end
		
		describe "brewery_id is zero" do 
			before { @beer.brewery_id = 0 }
			it {should_not be_valid}
		end
		
		describe "Missing beer_type_id" do 
			before { @beer.beer_type_id = nil }
			it {should_not be_valid}
		end
		
		describe "beer_type_id is zero" do 
			before { @beer.beer_type_id = 0 }
			it {should_not be_valid}
		end
		
		describe "Missing name" do 
			before { @beer.name = "" }
			it {should_not be_valid}
		end
		
		describe "Empty, thus invalid Beer object" do
			before { @beer = Beer.new }
			it { should_not be_valid }
		end
		
	end
end