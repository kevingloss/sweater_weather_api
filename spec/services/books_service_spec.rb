require 'rails_helper'

RSpec.describe BooksService do 
  it 'returns specified qty of books for a location', :vcr do
    books = BooksService.get_books('denver,co', 5)

    expect(books).to have_key(:num_found)
    expect(books).to have_key(:docs)
    expect(books[:docs].count).to eq(5)
    expect(books[:docs]).to be_a(Array)
    expect(books[:docs].first).to have_key(:isbn)
    expect(books[:docs].first[:isbn]).to be_a(Array)
    expect(books[:docs].first).to have_key(:title)
    expect(books[:docs].first).to have_key(:publisher)
    expect(books[:docs].first[:publisher]).to be_a(Array)
  end
end