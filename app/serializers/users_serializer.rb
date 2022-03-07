class UsersSerializer
  include JSONAPI::Serializer 
  attributes :email

  attribute :api_key do |object|
    object.api_keys.first[:api_key]
  end
end