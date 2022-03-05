class MapFacade 
  class << self 
    def get_coords(location)
      data = MapService.get_coords(location)

      Map.new(data)
    end
  end
end