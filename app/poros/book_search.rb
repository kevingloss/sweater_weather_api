class BookSearch 
  attr_reader :id, :forecast, :destination, :books, :total_books_found

  def initialize(book_details, current_forecast, destination)
    @id = nil 
    @destination = destination
    @forecast = { summary: current_forecast[:conditions], temperature: current_forecast[:temperature] }
    @total_books_found = book_details[:total_books]
    @books = get_books(book_details[:books])
  end

  def get_books(books)
    books.map do |book|
      {
        isbn: book.isbn,
        title: book.title,
        publisher: book.publisher
      }
    end
  end
end