class Api::V1::RoadTripController < ApplicationController
  before_action :validate_api_key, only: :create

  def create 
    if params[:origin].present? && params[:destination].present?
      road_trip = RoadTripFacade.get_road_trip(params[:origin], params[:destination])
      json_response(RoadtripSerializer.new(road_trip))
    else
      json_response({error: 'Please enter valid origin and destination.'}, :bad_request)
    end
  end

  private 
    def validate_api_key
      if ApiKey.valid?(params[:api_key]) == false
        json_response({error: 'Unauthorized.'}, :unauthorized)
      end
    end
end