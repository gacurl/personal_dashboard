# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  def index
    @categories = Category.includes(:links).order(:name)

    now = Time.zone.now
    today_range = now.beginning_of_day..now.end_of_day

    @schedule_items = ScheduleItem
      .where(start_time: today_range)
      .order(:start_time)

    @upcoming_schedule_items = ScheduleItem
      .where("start_time > ?", now.end_of_day)
      .order(:start_time)
      .limit(5)
  end
end
