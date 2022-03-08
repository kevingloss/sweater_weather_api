class RoadTripFacade 
  class << self
    def get_route(origin, destination)
      route = MapService.get_route(origin, destination)[:route]
      
      if route[:realTime]
        coords = MapFacade.get_coords(destination)
        forecast = ForecastService.destination_forecast(coords.lat, coords.lon)
        RoadTrip.new(origin, destination, route[:realTime], forecast)
      else
        RoadTrip.new(origin, destination, 'impossible route', {})
      end
    end
  end
end