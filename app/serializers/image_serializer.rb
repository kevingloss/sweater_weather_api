class ImageSerializer 
  include JSONAPI::Serializer
  attributes :image, :credit
end