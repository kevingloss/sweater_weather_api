require 'rails_helper'

RSpec.describe "Road Trip API Request", type: :request do
  it 'creates a road trip if all params are passed', :vcr do 
    user_1 = User.create!(email: 'user1@gmail.com', password: '123', password_confirmation: '123')
    key_1 = user_1.api_keys.create!(api_key: SecureRandom.hex)

    headers = { 'CONTENT_TYPE' => 'application/json' }
    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": key_1.api_key
    }

    post api_v1_road_trip_index_path, headers: headers, params: JSON.generate(body)

    data = parse_json[:data]
    
    expect(response.status).to eq(200)
    expect(data.keys).to eq([:id, :type, :attributes])
    expect(data[:id]).to eq(nil)
    expect(data[:type]).to eq('roadtrip')
    expect(data[:attributes].keys).to eq([:start_city, :end_city, :travel_time, :weather_at_eta])
    expect(data[:attributes][:start_city]).to be_a(String)
    expect(data[:attributes][:end_city]).to be_a(String)
    expect(data[:attributes][:travel_time]).to be_a(String)
    expect(data[:attributes][:weather_at_eta]).to be_a(Hash)
    expect(data[:attributes][:weather_at_eta].keys).to eq([:temperature, :conditions])
    expect(data[:attributes][:weather_at_eta][:temperature]).to be_a(Float)
    expect(data[:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end

 it 'throws an error if not using a correct api key' do 
    user_1 = User.create!(email: 'user1@gmail.com', password: '123', password_confirmation: '123')
    key_1 = user_1.api_keys.create!(api_key: SecureRandom.hex)

    headers = { 'CONTENT_TYPE' => 'application/json' }
    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }

    post api_v1_road_trip_index_path, headers: headers, params: JSON.generate(body)

    expect(response.status).to eq(401)
    expect(parse_json[:error]).to eq('Unauthorized.')
  end

  it 'throws an error if no api key' do 
    user_1 = User.create!(email: 'user1@gmail.com', password: '123', password_confirmation: '123')
    key_1 = user_1.api_keys.create!(api_key: SecureRandom.hex)

    headers = { 'CONTENT_TYPE' => 'application/json' }
    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO"
    }

    post api_v1_road_trip_index_path, headers: headers, params: JSON.generate(body)

    expect(response.status).to eq(401)
    expect(parse_json[:error]).to eq('Unauthorized.')
  end

  it 'throws an error if a destination is blank' do 
    user_1 = User.create!(email: 'user1@gmail.com', password: '123', password_confirmation: '123')
    key_1 = user_1.api_keys.create!(api_key: SecureRandom.hex)

    headers = { 'CONTENT_TYPE' => 'application/json' }
    body = {
      "origin": "Denver,CO",
      "destination": "",
      "api_key": key_1.api_key
    }

    post api_v1_road_trip_index_path, headers: headers, params: JSON.generate(body)

    expect(response.status).to eq(400)
    expect(parse_json[:error]).to eq('Please enter valid origin and destination.')
  end

  it 'throws an error if a origin is missing' do 
    user_1 = User.create!(email: 'user1@gmail.com', password: '123', password_confirmation: '123')
    key_1 = user_1.api_keys.create!(api_key: SecureRandom.hex)

    headers = { 'CONTENT_TYPE' => 'application/json' }
    body = {
      "destination": "Denver,CO",
      "api_key": key_1.api_key
    }

    post api_v1_road_trip_index_path, headers: headers, params: JSON.generate(body)

    expect(response.status).to eq(400)
    expect(parse_json[:error]).to eq('Please enter valid origin and destination.')
  end
end