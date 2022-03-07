class BooksService < ApiService 
  class << self 
    def connection
      Faraday.new(url: 'http://openlibrary.org/search.json') 
    end

    def get_books(location, qty)
      response = connection.get do |f|
        f.params['q'] = location 
        f.params['limit'] = qty
      end

      parse_json(response)
    end
  end
end