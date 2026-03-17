class DashboardController < ApplicationController
  def index
    @categories = Category.includes(:links).all
  end
end
