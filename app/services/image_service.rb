class ImageService < ApiService 
  class << self 
    def connection
      response = Faraday.new(url: 'https://api.flickr.com/services/rest') do |f|
        f.params['api_key'] = ENV['image_key']
        f.params['method'] = 'flickr.photos.search'
        f.params['format'] = 'json'
        f.params['nojsoncallback'] = '1'
        f.params['tag'] = 'skyline'
      end
    end

    def get_background(location)
      response = connection.get do |f|
        f.params['text'] = location
      end

      parse_json(response)
    end
  end
end