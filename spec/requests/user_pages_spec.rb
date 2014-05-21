require 'spec_helper'

describe "UserPages" do
	
	subject { page }
	
	describe "signup page" do
		
		before { visit signup_path }
		
		it { should have_selector('h1', 'Registrera')}
		it { should have_title('Registrera') }
	end
	
	describe "Singing up" do
		before { visit signup_path }
		let(:submit) { "Registrera" }
		
		describe "With invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end
		
		describe "With valid information" do
			before do
				fill_in "Name", with: "Exempel"
				fill_in "Email", with: "example@test.com"
				fill_in "Lösenord", with: "test_password"
				fill_in "Bekräfta lösenord", with: "test_password"
			end
			
			it "Should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
		end
	end
	
end
