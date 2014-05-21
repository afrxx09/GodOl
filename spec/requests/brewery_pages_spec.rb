require 'spec_helper'

describe "Brewery pages" do
	
	subject { page }
	
	describe "Create new Brewery page" do
	
		describe "Visit create new  Brewery page" do
			before { visit new_brewery_path }
					
			it { should have_title ('Lägg till bryggeri')}
		end
		
		describe "Create brewery" do
			
			before { visit new_brewery_path }
			let(:submit) { 'Lägg till' }
			
			describe "With invalid data" do
				it "should not create brewery" do
					expect { click_button submit }.not_to change(Brewery, :count)
				end
				
				describe "After submit" do
					before { click_button submit }
					
					it { should have_title('Lägg till bryggeri') }
					it { should have_content('error') }
				end
			end
			
			describe "With minimal valid information" do
				before do
					fill_in "Name", with: "Breweryname"
					fill_in "Nationality", with: "Country"
				end
				
				it "Should Create a brewery" do
					expect { click_button submit }.to change(Brewery, :count).by(1)
				end
				
				describe "After brewery is saved and brewery-list is shown" do
					before { click_button submit }
					it { should have_content('Bryggerier') }
				end
			end
			
		end
	
	end
	
	describe "Edit Brewery page" do
		
		describe "Visit Brewery-page edit" do
			let(:brewery) { FactoryGirl.create(:brewery) }
			before { visit edit_brewery_path(brewery) }
			
			it { should have_title ('Redigera') }
			it { should have_content (brewery.name) }
		end
		
		describe "Edit brewery" do
			
			let(:brewery) { FactoryGirl.create(:brewery) }
			before { visit edit_brewery_path(brewery) }
			let(:submit) { 'Spara' }
			
			describe "With invlaid information" do
				before do
					fill_in "Name", with: ""
					fill_in "Nationality", with: ""
				end
				
				it "should not create a new brewery" do
					expect { click_button submit }.not_to change(Brewery, :count)
				end
				
				describe "should render errors" do
					before { click_button submit }
					it { should have_content('error') }
				end
			end
			
			describe "With valid information" do
				
				describe "Without changes" do
					
					it "should not change the amont of breweries" do
						expect { click_button submit }.not_to change(Brewery, :count)
					end
					
					describe "Should not render errors" do
						before { click_button submit }
						it { should_not have_content('error') }
					end
					
					describe "Should render show-page" do
						before { click_button submit }
						it { should_not have_content('error') }
						it { should have_content(brewery.name) }
					end
					
				end
				
				describe "With changes" do
					
					before do
						fill_in "Name", with: "NewName"
						fill_in "Nationality", with: "NewNat"
					end
					
					it "should not change the amont of breweries" do
						expect { click_button submit }.not_to change(Brewery, :count)
					end
					
					describe "Should not render errors" do
						before { click_button submit }
						it { should_not have_content('error') }
					end
					
					describe "Should render show-page" do
						before { click_button submit }
						it { should_not have_content('error') }
						it { should have_content("NewName") }
						it { should have_content("NewNat") }
					end
					
				end
				
			end
			
		end
		
	end
	
	describe "Delete Brewery" do
		
		let(:brewery) { Brewery.first }
		before { visit breweries_path }
		
		it { should have_link('Ta bort', href: brewery_path(brewery)) }
		it "Should delete a brewery" do
			expect do
				click_link('Ta bort', match: :first)
			end.to change(Brewery, :count).by(-1)
		end
		
	end
	
end
