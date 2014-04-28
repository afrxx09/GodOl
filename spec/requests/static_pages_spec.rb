require 'spec_helper'

describe "StaticPages" do
	
	describe "Get root" do
		it "Should have title Start" do
			visit root_path
			expect(page).to have_content('start')
		end
	end
	
	describe "Get static_pages:start" do
		it "Should have title Start" do
			visit static_pages_start_path
			expect(page).to have_content('start')
		end
	end
	
	describe "Get static_pages:kontakt" do
		it "Should have title Kontakt" do
			visit static_pages_kontakt_path
			expect(page).to have_content('Kontakt')
		end
	end

end
