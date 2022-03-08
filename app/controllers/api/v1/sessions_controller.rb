class Api::V1::SessionsController < ApplicationController 
  include ApiKeyAuthenticatable 

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      json_response(UsersSerializer.new(user), :ok)
    else
      json_response({error: 'Please enter valid email and or password.'}, :bad_request)
    end
  end
end