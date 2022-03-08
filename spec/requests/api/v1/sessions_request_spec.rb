require 'rails_helper'

RSpec.describe "Session API Request", type: :request do
  it "user can log in" do
    user = User.create!(email: 'user@gmail.com', password: '123', password_confirmation: '123')
    user.api_keys.create!(api_key: SecureRandom.hex)
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post api_v1_sessions_path, headers: headers, params: JSON.generate({email: user.email, password: user.password })

    user_info = parse_json[:data]

    expect(response.status).to eq(200)
    expect(user_info.keys).to eq([:id, :type, :attributes])
    expect(user_info[:attributes].keys).to eq([:email, :api_key])
    expect(user_info[:type]).to eq('users')
    expect(user_info[:attributes][:email]).to eq(user.email)
    expect(user_info[:attributes][:api_key]).to be_a(String)
    expect(user_info[:attributes][:api_key]).to eq(user.api_keys.first[:api_key])
  end

  it "can't login with wrong password" do 
    user = User.create!(email: 'user@gmail.com', password: '123', password_confirmation: '123')
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post api_v1_sessions_path, headers: headers, params: JSON.generate({email: user.email, password: 'password' })

    expect(response.status).to eq(400)
    expect(parse_json[:error]).to eq('Please enter valid email and or password.')
  end

  it "can't login with the wrong email" do 
    user = User.create!(email: 'user@gmail.com', password: '123', password_confirmation: '123')
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post api_v1_sessions_path, headers: headers, params: JSON.generate({email: 'google@gmail.com', password: user.password })

    expect(response.status).to eq(400)
    expect(parse_json[:error]).to eq('Please enter valid email and or password.')
  end

  it "can't login without params" do 
    user = User.create!(email: 'user@gmail.com', password: '123', password_confirmation: '123')
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post api_v1_sessions_path, headers: headers

    expect(response.status).to eq(400)
    expect(parse_json[:error]).to eq('Please enter valid email and or password.')
  end
end