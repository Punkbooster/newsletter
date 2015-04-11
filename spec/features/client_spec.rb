require 'rails_helper'
RSpec.describe "client", type: :feature do
	describe "clients" do
		it "create client" do
			
			visit new_client_path
			fill_in 'client[imie]', :with => 'Arsen'
			fill_in 'client[nazwisko]', :with => 'Ugliar'
			fill_in 'client[email]', :with => '2morrow2late@rambler.ru'
			click_button 'submit_client'
			open_email('2morrow2late@rambler.ru')
			#current_email.save_and_open
			expect(current_email).to have_content 'Arsen'
			expect(current_email).to have_content 'Ugliar'

			visit new_client_path
			fill_in 'client[imie]', :with => 'Zahar'
			fill_in 'client[nazwisko]', :with => 'Pavliuk'
			fill_in 'client[email]', :with => 'a.ugliar@yahoo.com'
			click_button 'submit_client'
			open_email('a.ugliar@yahoo.com')
			#current_email.save_and_open
			expect(current_email).to have_content 'Zahar'
			expect(current_email).to have_content 'Pavliuk'

			visit new_client_path
			fill_in 'client[imie]', :with => 'Petro'
			fill_in 'client[nazwisko]', :with => 'Rosul'
			fill_in 'client[email]', :with => 'geesev@rambler.ru'
			click_button 'submit_client'
			open_email('geesev@rambler.ru')
			#current_email.save_and_open
			expect(current_email).to have_content 'Petro'
			expect(current_email).to have_content 'Rosul'
			clear_emails

			expect(page).to have_content 'Arsen'
			expect(page).to have_content 'Ugliar'
			expect(page).to have_content '2morrow2late@rambler.ru'
			expect(page).to have_content 'Zahar'
			expect(page).to have_content 'Pavliuk'
			expect(page).to have_content 'a.ugliar@yahoo.com'
			expect(page).to have_content 'Petro'
			expect(page).to have_content 'Rosul'
			expect(page).to have_content 'geesev@rambler.ru'
		end
	end
end