class ForecastFacade 
  class << self 
    def get_forecast(lat, lon)
      data = ForecastService.get_forecast(lat, lon)
      Forecast.new(data)
    end
  end
end