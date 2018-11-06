class HolidayPresenter
  def initialize
    @holiday_service = HolidayService.new
    @date = Time.now
    # @date = Time.now.strftime('%B%e')
  end

  def holidays_from_service
    @holiday_service.holidays_json
  end

  def all_holidays
    holidays_from_service['holidays'].values.flatten
  end

  def holidays_enum
    arr = []
    all_holidays.each do |holiday|
      if holiday['date'] == @date.strftime('%F')
        arr.push(holiday)
      end
    end
    arr
  end

  def find_holidays
    if holidays_enum.empty?
      @date += 86400
      find_holidays
    end
    holidays_enum
  end

  def holidays
    days = find_holidays
    str = ''
    if @date.strftime('%F') == Time.now.strftime('%F')
      if days.length > 1
        str += "Today's Holidays are "
        days.each do |holiday|
          str += holiday['name'] + 'and'
        end
        str = str[0...-4]
      else
        str += "Today's Holiday is #{days.first['name']}"
      end
    else
      if days.length > 1
        str += "The Next Holidays Coming Up Are "
        days.each do |holiday|
          str += holiday['name'] + 'and '
        end
        str = str[0...-4]
        str += " on #{days.first['date']}"
      else
        str += "The Next Holiday Coming Up Is #{days.first['name']} On #{days.first['date']}"
      end
    end
    str
  end
end
