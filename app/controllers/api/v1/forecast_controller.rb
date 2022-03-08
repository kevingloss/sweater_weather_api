class Api::V1::ForecastController < ApplicationController 
  def index 
    if params[:location].present?
      coords = MapFacade.get_coords(params[:location])
      forecast = ForecastFacade.get_forecast(coords.lat, coords.lon)

      json_response(ForecastSerializer.new(forecast))
    else
      json_response({error: 'Please enter valid location.'}, :bad_request)
    end
  end
end