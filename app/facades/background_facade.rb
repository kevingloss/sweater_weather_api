class BackgroundFacade 
  class << self 
    def get_background(location)
      data = ImageService.get_background(location)[:photos][:photo].first

      return nil if data == nil

      Background.new(data, location)
    end
  end
end