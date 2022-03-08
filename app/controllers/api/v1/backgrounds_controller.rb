class Api::V1::BackgroundsController < ApplicationController 
  def index 
    if params[:location].present?
      background = BackgroundFacade.get_background(params[:location])

      if background == nil
        json_response({message: 'No photo found.'}, status: :bad_request)
      else
        json_response(ImageSerializer.new(background))
      end
    else
      json_response({error: 'Please enter valid location.'}, status: :bad_request)
    end
  end
end