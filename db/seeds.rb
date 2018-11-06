require 'csv'

CSV.foreach('./db/csv/unofficial_holiday.csv', headers: true, header_converters: :symbol) do |holiday|
  holiday_name = holiday[:event].rstrip
  holiday_date = holiday[:day].lstrip

  UnofficialHoliday.create(name: holiday_name,
                           day: holiday_date,
                           category: holiday[:type]
                          )
end
