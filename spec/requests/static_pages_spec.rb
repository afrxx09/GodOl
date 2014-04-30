require 'spec_helper'

describe "StaticPages" do
	
	let(:base_title) { "God Öl" }
	
	subject { page }
	
	describe "Startpage" do
		
		before { visit root_path }
		
		it { expect(page).to have_title("#{base_title} | Start") }
		it { expect(page).to have_content('Start') }
		
	end
	
	describe "Kontakt-sidan" do
		
		before { visit contact_path }
		
		it { expect(page).to have_title("#{base_title} | Kontakt") }
		it { expect(page).to have_content('Kontakt') }
		
	end
	
	describe "Öl-listan" do
		
		before { visit beer_list_path }
		
		it { expect(page).to have_title("#{base_title} | Öl-lista") }
		it { expect(page).to have_content('Öl-lista') }
		
	end
		
	describe "Bryggeri-listan" do
		
		before { visit brewery_list_path }
		
		it { expect(page).to have_title("#{base_title} | Bryggeri-lista") }
		it { expect(page).to have_content('Bryggeri-lista') }
				
	end

end
