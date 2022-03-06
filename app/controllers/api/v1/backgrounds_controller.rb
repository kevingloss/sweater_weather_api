class Api::V1::BackgroundsController < ApplicationController 
  def index 
    if params[:location].present?
      background = BackgroundFacade.get_background(params[:location])

      if background == nil
        render json: {message: 'No photo found.'}, status: :bad_request
      else
        json_response(ImageSerializer.new(background))
      end
    else
      render json: {error: 'Please enter valid location.'}, status: :bad_request
    end
  end
end