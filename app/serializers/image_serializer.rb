class ImageSerializer 
  include JSONAPI::Serializer
  attributes :image_url, :location, :credit
end