require 'rails_helper'

RSpec.describe 'Forecast API Requests', type: :request do 
  it 'gets a forecast when location is passed as param', :vcr do 
    headers = { 'CONTENT_TYPE' => 'application/json' }

    get api_v1_forecast_index_path, headers: headers, params: {location: 'boston, ma'}

    data = parse_json[:data]

    expect(response.status).to eq(200)
    expect(data[:id]).to eq(nil)
    expect(data[:type]).to eq('forecast')
    expect(data[:attributes]).to be_a(Hash)
    expect(data[:attributes].keys).to eq([:current_weather, :daily_weather, :hourly_weather])
    expect(data[:attributes][:current_weather]).to be_a(Hash)
    expect(data[:attributes][:daily_weather]).to be_a(Array)
    expect(data[:attributes][:hourly_weather]).to be_a(Array)
    expect(data[:attributes][:current_weather]).to_not have_key(:pressure)
    expect(data[:attributes][:current_weather]).to_not have_key(:dew_point)
    expect(data[:attributes][:daily_weather].first).to_not have_key(:moon_phase)
    expect(data[:attributes][:daily_weather].first).to_not have_key(:temp)
    expect(data[:attributes][:hourly_weather].first).to_not have_key(:wind_speed)
    expect(data[:attributes][:hourly_weather].first).to_not have_key(:weather)
  end

  it 'gets a forecast for international cities', :vcr do 
    headers = { 'CONTENT_TYPE' => 'application/json' }

    get api_v1_forecast_index_path, headers: headers, params: {location: 'rome, italy'}

    data = parse_json[:data]

    expect(response.status).to eq(200)
    expect(data[:id]).to eq(nil)
    expect(data[:type]).to eq('forecast')
    expect(data[:attributes]).to be_a(Hash)
    expect(data[:attributes].keys).to eq([:current_weather, :daily_weather, :hourly_weather])
    expect(data[:attributes][:current_weather]).to be_a(Hash)
    expect(data[:attributes][:daily_weather]).to be_a(Array)
    expect(data[:attributes][:hourly_weather]).to be_a(Array)
  end

  it 'sends error if no location is given', :vcr do 
    headers = { 'CONTENT_TYPE' => 'application/json' }

    get api_v1_forecast_index_path, headers: headers

    expect(response.status).to eq(400)
    expect(parse_json[:error]).to eq('Please enter valid location.')
  end
end