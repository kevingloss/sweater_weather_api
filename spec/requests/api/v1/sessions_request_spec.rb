require 'rails_helper'

RSpec.describe "Session API Request", type: :request do
  xit "user can log in" do
    user = User.create!(email: 'user@gmail.com', password: '123', password_confirmation: '123')
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post api_v1_sessions_path, headers: headers, params: JSON.generate(user: {email: user.email, password: user.password })

    response.status.should be(201)
  end
end