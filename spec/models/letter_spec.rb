require 'rails_helper'

RSpec.describe "letter", type: :feature do

  describe "letters" do
    
    it "create letter" do
        

        visit new_letter_path
        fill_in 'letter[title]', :with => 'AAA'
        fill_in 'letter[topic]', :with => 'SSS'
        fill_in 'letter[content]', :with => 'Some content'
        click_button 'submit_letter'
      
      #clear_emails
      open_email('2morrow2late@rambler.ru')
      current_email.save_and_open
      #expect(current_email).to have_content 'AAA'
      

      expect(page).to have_content 'AAA'
      expect(page).to have_content 'SSS'
      expect(page).to have_content 'Some content'
      

      #save_and_open_page
    end
  end
end