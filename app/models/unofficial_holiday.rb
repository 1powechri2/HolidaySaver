class UnofficialHoliday < ApplicationRecord

  @date = Time.now

  def self.holidays_enum
    where(day: @date.strftime('%B %e'))
  end

  def self.current_holiday
    str = ''
    if holidays_enum.empty? != true
      if holidays_enum.length > 1
        str += "Today's Holidays Are "
        holidays_enum.each do |holiday|
          str += holiday['name'] + ' and '
        end
        str = str[0...-4]
        str += "on #{holidays_enum.first.day}"
      else
        str += "Today's Holiday is #{holidays_enum.first.name}"
      end
    end
    str
  end

  def self.cron_mailer
    if current_holiday != ''
      User.all.each do |user|
        CronMailer.new(current_holiday, user).mail_cron
        sleep 10
      end
    end
  end

  def self.find_holidays
    if holidays_enum.empty?
      @date += 86400
      find_holidays
    end
    holidays_enum
  end

  def self.holidays
    days = find_holidays
    str = ''
    if @date.strftime('%B %e') == Time.now.strftime('%B %e')
      if days.length > 1
        str += "Today's Holidays are "
        days.each do |holiday|
          str += holiday['name'] + ' and '
        end
        str = str[0...-4]
      else
        str += "Today's Holiday is #{days.first['name']}"
      end
    else
      if days.length > 1
        str += "The Next Holidays Coming Up Are "
        days.each do |holiday|
          str += holiday['name'] + ' and '
        end
        str = str[0...-4]
        str += "on #{days.first.day}"
      else
        str += "The Next Holiday Coming Up Is #{days.first.name} On #{days.first.day}"
      end
    end
    str
  end
end
