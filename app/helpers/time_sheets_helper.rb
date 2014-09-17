module TimeSheetsHelper
  def format_time_sheet(end_time, start_time, lunch_time = 0)
    format_time(end_time.to_i - start_time.to_i - lunch_time)
  end

  def format_time(value)
    "#{(value/3600)}h #{(value%3600)/60}m"
  end
end
