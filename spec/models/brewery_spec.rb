require 'spec_helper'

describe Brewery do
	
	before do
		@brewery = Brewery.new(
			name: "Bryggeriet",
			address: "Street 123",
			address2: "c/o A Place",
			city: "A town",
			state: "CA",
			zip: "12345",
			nationality: "USA",
			description: "A brewery in a city in CA."
		)
	end
	
	subject { @brewery }
	
	it { should respond_to(:name) }
	it { should respond_to(:address) }
	it { should respond_to(:address2) }
	it { should respond_to(:city) }
	it { should respond_to(:state) }
	it { should respond_to(:zip) }
	it { should respond_to(:nationality) }
	it { should respond_to(:description) }
	it { should be_valid }
	
	describe "Minimal but still valid Brewery object" do
		before do
			@brewery = Brewery.new(
				name: "Bryggeriet",
				nationality: "USA"
			)
		end
		it { should be_valid }
	end
	
	describe "Brewery with missing required fields" do
		
		describe "Missing name" do
			before { @brewery.name = "" }
			it { should_not be_valid }
		end
		
		describe "Missing nationality" do
			before { @brewery.nationality = "" }
			it { should_not be_valid }
		end
		
		describe "New empty, thus invalid Brewery" do
			before {@brewery = Brewery.new }
			it { should_not be_valid }
		end
		
	end
end
