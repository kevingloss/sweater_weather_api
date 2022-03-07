class Api::V1::SessionsController < ApplicationController 
  include ApiKeyAuthenticatable 

  def create
    authenticate_with_http_basic do |email, password| 
      user = User.find_by email: email 
      # binding.pry
      if user&.authenticate(password) 
        api_key = user.api_keys.create! token: SecureRandom.hex 
        # binding.pry
        render json: api_key, status: :created and return 
      end 
    end
 
    render status: :unauthorized
  end
end