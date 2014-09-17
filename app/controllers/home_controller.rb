class HomeController < ApplicationController
  def show
    if current_user
      @sheets = current_user.time_sheets.where('closed_at is not null').order(created_at: :desc)
      @today = current_user.time_sheets.where('created_at > ?', Time.now.beginning_of_day).where('closed_at is null').first
    end
  end
end