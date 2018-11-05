class HolidayService

  def holidays_api_conn
    Faraday.new(:url => 'https://holidayapi.pl') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def holidays_api_fetch_holidays
    @fetch ||= holidays_api_conn.get '/v1/holidays?country=US&year=2018'
  end

  def holidays_json
    JSON.parse(holidays_api_fetch_holidays.body)
  end

end
