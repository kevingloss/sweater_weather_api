class ForecastService < ApiService 
  class << self 
    def connection
      response = Faraday.new(url: 'https://api.openweathermap.org/data/2.5/onecall') do |f|
        f.params['appid'] = ENV['weather_key']
      end
    end

    def get_forecast(lat, lon)
      response = connection.get do |f|
        f.params['lat'] = lat 
        f.params['lon'] = lon
        f.params['exclude'] = 'minutely,alerts'
        f.params['units'] = 'imperial'
      end

      parse_json(response)
    end

    def destination_forecast(lat, lon)
      response = connection.get do |f|
        f.params['lat'] = lat 
        f.params['lon'] = lon
        f.params['exclude'] = 'minutely,alerts,current'
        f.params['units'] = 'imperial'
      end

      parse_json(response)
    end
  end
end