class Background 
  attr_reader :id, :image_url, :location, :credit

  def initialize(data, location)
    @id = nil 
    @location = location
    @image_url = background_url(data)
    @credit = {author: "ID: #{data[:owner]}", source: 'flickr.com'}
  end

  def background_url(data)
    "https://live.staticflickr.com/#{data[:server]}/#{data[:id]}_#{data[:secret]}.jpg"
  end
end