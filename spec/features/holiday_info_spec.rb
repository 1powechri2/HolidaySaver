require 'rails_helper'

describe 'A user visits the' do
  context 'root page and it' do
    it 'tells us holiday information' do

        visit '/'

        expect(page).to have_content("Today's Holiday is Election Day")
      
    end
  end
end
