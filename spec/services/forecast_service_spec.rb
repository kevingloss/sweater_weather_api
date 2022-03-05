require 'rails_helper'

RSpec.describe ForecastService do 
  it 'can get the forecast given lat/lon', :vcr do
    forecast = ForecastService.get_forecast(42.358894, -71.056742)

    expect(forecast).to have_key(:current)
    expect(forecast).to have_key(:daily)
    expect(forecast).to have_key(:hourly)
    expect(forecast).to_not have_key(:minutely)
    expect(forecast).to_not have_key(:alerts)

    expect(forecast[:current]).to have_key(:dt)
    expect(forecast[:current]).to have_key(:sunrise)
    expect(forecast[:current]).to have_key(:sunset)
    expect(forecast[:current]).to have_key(:temp)
    expect(forecast[:current]).to have_key(:feels_like)
    expect(forecast[:current]).to have_key(:humidity)
    expect(forecast[:current]).to have_key(:uvi)
    expect(forecast[:current]).to have_key(:visibility)
    expect(forecast[:current]).to have_key(:weather)
    expect(forecast[:current][:weather].first).to have_key(:description)
    expect(forecast[:current][:weather].first).to have_key(:icon)
    
    expect(forecast[:hourly]).to be_a(Array)
    expect(forecast[:hourly].first).to have_key(:dt)
    expect(forecast[:hourly].first).to have_key(:temp)
    expect(forecast[:hourly].first).to have_key(:weather)
    expect(forecast[:hourly].first[:weather].first).to have_key(:description)
    expect(forecast[:hourly].first[:weather].first).to have_key(:icon)

    expect(forecast[:daily]).to be_a(Array)
    expect(forecast[:daily].first).to have_key(:dt)
    expect(forecast[:daily].first).to have_key(:sunrise)
    expect(forecast[:daily].first).to have_key(:sunset)
    expect(forecast[:daily].first).to have_key(:temp)
    expect(forecast[:daily].first[:temp]).to have_key(:max)
    expect(forecast[:daily].first[:temp]).to have_key(:min)
    expect(forecast[:daily].first).to have_key(:weather)
    expect(forecast[:daily].first[:weather].first).to have_key(:description)
    expect(forecast[:daily].first[:weather].first).to have_key(:icon)
  end
end
