require 'spec_helper'

describe "Brewery pages" do
	
	subject { page }
	
	describe "Brewery page: create new" do
		before { visit new_brewery_path }
				
		it { should have_title ('Lägg till bryggeri')}
	end
	
	describe "Brewery page: edit" do
		#let(:brewery) { FactoryGirl.create(:brewery) }
		
		before do
			@b = Brewery.first
			visit edit_brewery_path(@b)
		end
		
		it { should have_title ('Lägg till bryggeri')}
	end

end
