module ApplicationHelper
  def format_duration_minutes(minutes)
    hours = minutes / 60
    mins = minutes % 60
    "#{hours}h#{sprintf('%02d', mins)}"
  end
end
