require 'rails_helper'

describe 'A user visits the' do
  context 'root page and it' do
    it 'tells us holiday information' do
      VCR.use_cassette('holidays') do
        visit '/'

        expect(page).to have_content('The Next Holiday Coming Up Is Election Day On 2018-11-06')
      end
    end
  end
end
