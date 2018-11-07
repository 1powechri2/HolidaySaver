require 'rails_helper'

describe 'A user visits the' do
  context 'root page and it' do
    it 'tells us today single holiday information' do
      holiday = UnofficialHoliday.create(name: "Dood Day",
                                         day: "#{Time.now.strftime('%B %e')}",
                                        category: "Doo Dad")

      allow(UnofficialHoliday).to receive(:find_holidays).and_return([holiday])

      visit '/'

      expect(page).to have_content("Today's Holiday is Dood Day")
    end
    it 'tells us today multiple holiday information' do
      holiday1 = UnofficialHoliday.create(name: "Dood Day",
                                         day: "#{Time.now.strftime('%B %e')}",
                                        category: "Doo Dad")

      holiday2 = UnofficialHoliday.create(name: "Lady Day",
                                         day: "#{Time.now.strftime('%B %e')}",
                                        category: "Chics Rule")

      allow(UnofficialHoliday).to receive(:find_holidays).and_return([holiday1, holiday2])

      visit '/'

      expect(page).to have_content("Today's Holidays are Dood Day and Lady Day")
    end
  end
end
