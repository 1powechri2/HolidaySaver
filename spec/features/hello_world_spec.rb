require 'rails_helper'

describe 'Setup test to check Travis CI' do
  context 'root page' do
    it 'says hello world' do
      VCR.use_cassette('holidays') do
        visit '/'

        expect(page).to have_content('The Next Holiday Coming Up Is Election Day On 2018-11-06')
      end
    end
  end
end
