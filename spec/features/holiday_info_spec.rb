require 'rails_helper'

describe 'A user visits the' do
  context 'root page and it' do
    it 'tells us holiday information' do
      visit '/'

      expect(page).to have_content("The Next Holidays Coming Up Are National Sundae Day and Singles Day on November 11")
    end
  end
end
