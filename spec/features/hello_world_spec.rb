require 'rails_helper'

describe 'Setup test to check Travis CI' do
  context 'root page' do
    it 'says hello world' do
      visit '/'

      expect(page).to have_content('Hello World')
    end
  end
end
