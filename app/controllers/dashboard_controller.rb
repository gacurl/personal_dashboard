class DashboardController < ApplicationController
  def index
    @categories = Category.includes(:links).order(:name)
    @schedule_items = ScheduleItem
      .where(start_time: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
      .order(:start_time)
  end
end
