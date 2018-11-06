class RootController < ApplicationController
  def show
    @holiday_message = UnofficialHoliday.holidays
  end
end
