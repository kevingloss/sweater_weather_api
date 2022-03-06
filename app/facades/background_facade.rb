class BackgroundFacade 
  class << self 
    def get_background(location)
      data = ImageService.get_background(location)[:photos][:photo].first

      return {message: 'No photo found.'} if data == nil

      Background.new(data, location)
    end
  end
end