# app/helpers/dashboard_helper.rb
module DashboardHelper
  def next_event_urgency_class(event)
    return "is-normal" unless event

    now = Time.zone.now
    time_diff = event.start_time - now

    if time_diff.between?(-1.hour, 0)
      "is-live"
    elsif time_diff < 1.hour
      "is-imminent"
    elsif time_diff < 24.hours
      "is-soon"
    else
      "is-normal"
    end
  end

  def next_event_primary_text(event)
    return "No upcoming events" unless event

    now = Time.zone.now
    event_time = event.start_time
    time_diff = event_time - now

    label =
      if time_diff.between?(-1.hour, 0)
        "Live Now"
      elsif event_time.to_date == now.to_date
        "Today"
      elsif event_time.to_date == now.to_date + 1
        "Tomorrow"
      else
        event_time.strftime("%a, %b %-d")
      end

    "#{label} at #{event_time.strftime("%H:%M")}"
  end

  def next_event_status_text(event)
    return "" unless event

    now = Time.zone.now
    time_diff = event.start_time - now

    if time_diff.between?(-1.hour, 0)
      "In progress"
    else
      "Starts in #{distance_of_time_in_words(now, event.start_time)}"
    end
  end
end