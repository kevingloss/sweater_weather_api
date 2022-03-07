require 'rails_helper'

RSpec.describe "User API Request", type: :request do
  it "can create a new user" do
    headers = { 'CONTENT_TYPE' => 'application/json' }
    params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    post api_v1_users_path, headers: headers, params: JSON.generate(params)

    user = parse_json[:data]

    expect(response.status).to eq(201)
    expect(user.keys).to eq([:id, :type, :attributes])
    expect(user[:attributes].keys).to eq([:email, :api_key])
    expect(user[:type]).to eq('users')
    expect(user[:attributes][:email]).to eq(params[:email])
  end

  it "won't create user if password/confirmation don't match" do
    headers = { 'CONTENT_TYPE' => 'application/json' }
    params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "word"
    }

    post api_v1_users_path, headers: headers, params: JSON.generate(params)

    expect(response.status).to eq(400)
    expect(parse_json[:error]).to eq("Please enter valid email, password, and password confirmation.")
  end

  it "won't create user without email" do
    headers = { 'CONTENT_TYPE' => 'application/json' }
    params = {
      "email": "",
      "password": "password",
      "password_confirmation": "password"
    }

    post api_v1_users_path, headers: headers, params: JSON.generate(params)

    expect(response.status).to eq(400)
    expect(parse_json[:error]).to eq("Please enter valid email, password, and password confirmation.")
  end

  it "won't create user without params" do
    headers = { 'CONTENT_TYPE' => 'application/json' }
    

    post api_v1_users_path, headers: headers

    expect(response.status).to eq(400)
    expect(parse_json[:error]).to eq('Please enter valid email, password, and password confirmation.')
  end
end