class MapService < ApiService
  class << self
    def connection
      response = Faraday.new(url: 'http://www.mapquestapi.com/') do |f|
        f.params['key'] = ENV['map_quest_key']
      end
    end

    def get_coords(location)
      response = connection.get('geocoding/v1/address') do |f|
        f.params['location'] = location
      end

      parse_json(response)
    end

    def get_route(from, to)
      response = connection.get('directions/v2/route') do |f|
        f.params['from'] = from
        f.params['to'] = to 
      end

      parse_json(response)
    end
  end
end