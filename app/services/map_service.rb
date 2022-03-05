class MapService < ApiService
  class << self
    def connection
      response = Faraday.new(url: 'http://www.mapquestapi.com/geocoding/v1/') do |f|
        f.params['key'] = ENV['map_quest_key']
      end
    end

    def get_coords(location)
      response = connection.get('address') do |f|
        f.params['location'] = location
      end

      parse_json(response)
    end
  end
end