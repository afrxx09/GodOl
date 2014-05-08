require 'spec_helper'

describe "Brewery pages" do
	
	subject { page }
	
	describe "Brewery page: create new" do
		before { visit new_brewery_path }
		#before { visit "/breweries/new" }
				
		it { should have_title ('Lägg till bryggeri')}
	end
	
	describe "Brewery page: edit" do
		#let(:brewery) { FactoryGirl.create(:brewery) }
		before { visit brewery_path}
		
		it { should have_title ('Lägg till bryggeri')}
	end

end
