class Api::V1::HolidayController < ApplicationController
  def index
    render json: UnofficialHoliday.all
  end
end
