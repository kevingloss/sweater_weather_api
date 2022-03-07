class BookFacade 
  class << self 
    def get_books(location, qty)
      data = BooksService.get_books(location, qty)
      
      books = data[:docs].map do |book|
        Book.new(book)
      end
      
      { total_books: data[:num_found], books: books }
    end
  end
end