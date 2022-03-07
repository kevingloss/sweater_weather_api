class Api::V1::BooksController < ApplicationController
  def index 
    if params[:location].present? && (params[:quantity].present? && params[:quantity].to_i >= 0)
      coords = MapFacade.get_coords(params[:location])
      current_forecast = ForecastFacade.get_forecast(coords.lat, coords.lon).current
      book_details = BookFacade.get_books(params[:location], params[:quantity])
      destination_books = BookSearch.new(book_details, current_forecast, params[:location])
      json_response(BooksSerializer.new(destination_books))
    else
      render json: {error: 'Please enter valid location and quantity.'}, status: :bad_request
    end
  end
end