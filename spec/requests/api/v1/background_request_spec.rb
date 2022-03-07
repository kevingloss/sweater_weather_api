require 'rails_helper'

RSpec.describe 'Background API Requests', type: :request do 
  it 'gets info for background image', :vcr do 
    headers = { 'CONTENT_TYPE' => 'application/json' }

    get api_v1_backgrounds_path, headers: headers, params: {location: 'boston, ma'}

    data = parse_json[:data]

    expect(response.status).to eq(200)
    expect(data[:id]).to eq(nil)
    expect(data[:type]).to eq('image')
    expect(data[:attributes]).to be_a(Hash)
    expect(data[:attributes].keys).to eq([:image, :credit])
    expect(data[:attributes][:image].keys).to eq([:location, :image_url])
    expect(data[:attributes][:credit].keys).to eq([:author, :source])
  end

  it 'gets a forecast for international cities', :vcr do 
    headers = { 'CONTENT_TYPE' => 'application/json' }

    get api_v1_backgrounds_path, headers: headers, params: {location: 'boston, ma'}

    data = parse_json[:data]

    expect(response.status).to eq(200)
    expect(data[:id]).to eq(nil)
    expect(data[:type]).to eq('image')
    expect(data[:attributes]).to be_a(Hash)
    expect(data[:attributes].keys).to eq([:image, :credit])
    expect(data[:attributes][:image].keys).to eq([:location, :image_url])
    expect(data[:attributes][:credit].keys).to eq([:author, :source])
  end

  it 'sends error if no location is given', :vcr do 
    headers = { 'CONTENT_TYPE' => 'application/json' }

    get api_v1_backgrounds_path, headers: headers

    expect(response.status).to eq(400)
    expect(parse_json[:error]).to eq('Please enter valid location.')
  end

  it 'sends message if photo not found', :vcr do 
    headers = { 'CONTENT_TYPE' => 'application/json' }

    get api_v1_backgrounds_path, headers: headers, params: {location: ';alkfje89uye['}

    expect(response.status).to eq(400)
    expect(parse_json[:message]).to eq('No photo found.')
  end
end