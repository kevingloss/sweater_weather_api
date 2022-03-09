class RoadTrip 
  attr_reader :id, :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(origin, destination, duration, forecast)
    @id = nil 
    @start_city = origin
    @end_city = destination 
    @travel_time = trip_duration(duration)
    @weather_at_eta = destination_weather(duration, forecast)
  end

  def trip_duration(duration)
    return duration if duration == 'impossible route'
    return 'Please find alternate route.' if duration == 10000000

    hours = duration / 3600
    minutes = duration % 3600 / 60

    "Trip duration is #{hours} hours and #{minutes} minutes."
  end

  def destination_weather(duration, forecast)
    return forecast if forecast == {}

    offset_hours = (duration/3600.0).round
    offset_hours = 1 if offset_hours < 1

    if offset_hours <= 48 
      offset_forecast = forecast[:hourly][offset_hours - 1]
      {
        temperature: offset_forecast[:temp],
        conditions: offset_forecast[:weather].first[:description]
      }
    elsif (offset_hours / 24).round <= 8
      offset_days = (offset_hours / 24.0).round
      offset_forecast = forecast[:daily][offset_days - 1]
      {
        temperature: offset_forecast[:temp][:max],
        conditions: offset_forecast[:weather].first[:description]
      }
    else
      {
        temperature: 'Unknown',
        conditions: 'Unknown'
      }
    end
  end
end