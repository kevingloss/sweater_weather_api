require 'spec_helper'

RSpec.describe "Session" do
  it "user can log in" do
    user = User.create!(email: 'userre@gmail.com', password: '123', password_confirmation: '123')
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post api_v1_sessions_path, headers: headers, params: {email: user.email, password: user.password }

    response.status.should be(201)
  end
end