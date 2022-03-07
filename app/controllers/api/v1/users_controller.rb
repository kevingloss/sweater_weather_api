class Api::V1::UsersController < ApplicationController 
  def create 
    user = User.new(user_params)

    if user.save 
      user.api_keys.create!(api_key: SecureRandom.hex)

      json_response(UsersSerializer.new(user), :created)
    else
      json_response({error: 'Please enter valid email, password, and password confirmation.'}, :bad_request)
    end
  end

  private 
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end