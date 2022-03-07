require 'rails_helper'

RSpec.describe BookSearch, type: :model do 
  it 'can create a book_search', :vcr do 
    book = Book.new(isbn: ["9780762507849", "0762507845"], publisher: ["Universal Map Enterprises"], title: "Denver, Co")
    book_2 = Book.new(isbn:["0883183668", "9780883183663"], publisher: ["American Institute of Physics"], title:"Photovoltaic safety, Denver, CO, 1988")
    books = { total_books: 2, books: [book, book_2] }
    coords = MapFacade.get_coords('denver,co')
    current_forecast = ForecastFacade.get_forecast(coords.lat, coords.lon).current


    book_search = BookSearch.new(books, current_forecast, 'denver,co')

    expect(book_search.destination).to eq('denver,co')
    expect(book_search.books).to eq([{:isbn=>["9780762507849", "0762507845"], :title=>"Denver, Co", :publisher=>["Universal Map Enterprises"]},
      {:isbn=>["0883183668", "9780883183663"], :title=>"Photovoltaic safety, Denver, CO, 1988", :publisher=>["American Institute of Physics"]}])
    expect(book_search.forecast).to eq({:summary=>"snow", :temperature=>25.77})
    expect(book_search.total_books_found).to eq(2)
  end
end