require 'rails_helper'

RSpec.describe ForecastFacade do 
  it 'returns a forecast', :vcr do 
    forecast = ForecastFacade.get_forecast(42.358894, -71.056742)

    expect(forecast).to be_an_instance_of(Forecast)
    expect(forecast.current).to be_a(Hash)
    expect(forecast.hourly).to be_a(Array)
    expect(forecast.daily).to be_a(Array)
  end
end