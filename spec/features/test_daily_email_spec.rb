require 'rails_helper'

describe 'If a holiday happens on current date' do
  it 'sends and email to all users in db' do
    user = User.create(user_name: 'Chris',
                       email: 'chris.ian.powell@gmail.com',
                       password: 'godyes420')

    holiday = UnofficialHoliday.create(name: "Dood Day",
                                       day: "#{Time.now.strftime('%B %e')}",
                                       category: "Doo Dad")

    allow(UnofficialHoliday).to receive(:holidays_enum).and_return([holiday])

    # UnofficialHoliday.cron_mailer
  end
end
