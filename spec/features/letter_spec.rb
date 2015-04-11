require 'rails_helper'

RSpec.describe Letter do
  it "emails userss" do


  	visit new_client_path
	fill_in 'client[imie]', :with => 'Arsen'
	fill_in 'client[nazwisko]', :with => 'Ugliar'
	fill_in 'client[email]', :with => '2morrow2late@rambler.ru'
	click_button 'submit_client'

	visit new_client_path
	fill_in 'client[imie]', :with => 'Zahar'
	fill_in 'client[nazwisko]', :with => 'Pavliuk'
	fill_in 'client[email]', :with => 'a.ugliar@yahoo.com'
	click_button 'submit_client'

	visit new_client_path
	fill_in 'client[imie]', :with => 'Petro'
	fill_in 'client[nazwisko]', :with => 'Rosul'
	fill_in 'client[email]', :with => 'geesev@rambler.ru'
	click_button 'submit_client'

	expect(page).to have_content 'Arsen'
	expect(page).to have_content 'Zahar'
	expect(page).to have_content 'Petro'

  	visit new_letter_path
  	fill_in 'letter[title]', :with => 'Some letter title'
	fill_in 'letter[topic]', :with => 'Some letter topic'
	fill_in 'letter[content]', :with => 'Some letter content'
	click_button 'submit'

	expect(page).to have_content 'Some letter title'
	expect(page).to have_content 'Some letter topic'
	expect(page).to have_content 'Some letter content'

	open_email('2morrow2late@rambler.ru')
	#current_email.save_and_open
	expect(current_email).to have_content 'Here is a message for you from Newsletter.com'

	
	open_email('a.ugliar@yahoo.com')
	#current_email.save_and_open
	expect(current_email).to have_content 'Here is a message for you from Newsletter.com'

	
	open_email('geesev@rambler.ru')
	#current_email.save_and_open
	expect(current_email).to have_content 'Here is a message for you from Newsletter.com'
	clear_emails
	
	
  end
end