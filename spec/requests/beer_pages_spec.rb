require 'spec_helper'

describe "Beer pages" do
	
	subject { page }
	let(:beer) { Beer.first }
	#let(:beer) { FactoryGirl.create(:beer) }
	
	describe "Index" do
		
		before { visit beers_path }
		
		describe "Page" do
			it { should have_content('Öl') }
			it { should have_link(beer.name, href: edit_beer_path(beer)) }
		end
		
		describe "Beer-link" do
			before { click_link beer.name }
			it { should have_content(beer.name) }
		end
		
	end
	
	describe "Create" do
		
	end
	
	describe "Edit" do
		
	end
	
	describe "Delete" do
		
	end
	
end