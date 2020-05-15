module ApplicationHelper
  def formated_time(time)
    time.strftime("%d %B,%Y - %I:%M %p")
  end
end
