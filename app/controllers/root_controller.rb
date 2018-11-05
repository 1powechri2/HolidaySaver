class RootController < ApplicationController
  def show
    @holiday_message = HolidayPresenter.new.holidays
  end
end
