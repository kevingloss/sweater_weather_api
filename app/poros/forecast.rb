class Forecast 
  attr_reader :id, :current, :hourly, :daily 

  def initialize(data)
    @id = nil
    @current = current_weather(data[:current])
    @hourly = hourly_weather(data[:hourly])
    @daily = daily_weather(data[:daily])
  end

  def current_weather(data)
    {
      datetime: Time.at(data[:dt]).to_s,
      sunrise: Time.at(data[:sunrise]).to_s,
      sunset: Time.at(data[:sunset]).to_s,
      temperature: data[:temp],
      feels_like: data[:feels_like],
      humidity: data[:humidity],
      uvi: data[:uvi],
      visibility: data[:visibility],
      conditions: data[:weather].first[:description],
      icon: data[:weather].first[:icon]
    }
  end

  def hourly_weather(data)
    data.first(8).map do |hour|
      {
        time: Time.at(hour[:dt]).strftime('%H:%M:%S'),
        temperature: hour[:temp],
        conditions: hour[:weather].first[:description],
        icon: hour[:weather].first[:icon]
      }
    end
  end

  def daily_weather(data)
    data.first(5).map do |day|
      {
        date: Time.at(day[:dt]).strftime('%Y-%m-%d'),
        sunrise: Time.at(day[:sunrise]).to_s,
        sunset: Time.at(day[:sunset]).to_s,
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:min],
        conditions: day[:weather].first[:description],
        icon: day[:weather].first[:icon]
      }
    end
  end
end