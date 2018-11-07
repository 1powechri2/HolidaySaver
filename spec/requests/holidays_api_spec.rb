require 'rails_helper'

describe 'Holidays API endpoint' do
  it 'returns JSON of all holidays' do
    get '/api/v1/holidays'

    expect(response).to be_successful
    holidays = JSON.parse(response.body)
    expect(holidays.length).to eq(400)
    expect(holidays.first['name']).to eq('National Trivia Day')
    expect(holidays.first['day']).to eq('January 4')
  end
end
