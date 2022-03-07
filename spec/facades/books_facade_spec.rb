require 'rails_helper'

RSpec.describe BookFacade do 
  it 'returns books', :vcr do 
    book_details = BookFacade.get_books('denver,co', 5)

    expect(book_details[:books].count).to eq(5)
    expect(book_details[:books].first).to be_an_instance_of(Book)
    expect(book_details[:total_books]).to eq(41867)
  end

  it 'returns nil if no book found', :vcr do 
    book_details = BookFacade.get_books('akshgai;eoirg0gij', 5)

    expect(book_details[:books].first).to eq(nil)
  end
end