require 'rails_helper'

describe 'User visits root' do
  it 'signs up and is added to the db' do
    VCR.use_cassette('sign_up') do
      visit '/'

      expect(page).to have_content('Sign Up or Login')

      expect(page).to have_css('#sign_up_div', visible: false)

      find('#signUp').click

      expect(page).to have_css('#sign_up_div', visible: true)

      expect(page).to have_content('SIGN UP TO BECOME A MEMBER!')

      fill_in :user_name, with: 'ChrisPowell'
      fill_in :email, with: 'dood@doodmail.com'
      fill_in :password, with: 'deathMetal978'

      click_on 'SIGN UP'

      expect(current_path).to eq('/')
      expect(page).to have_content('Welcome ChrisPowell')
    end
  end
end
