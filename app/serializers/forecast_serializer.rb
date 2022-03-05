class ForecastSerializer
  include JSONAPI::Serializer 
  attribute :current_weather do |object|
    object.current
  end

  attribute :daily_weather do |object|
    object.daily
  end

  attribute :hourly_weather do |object|
    object.hourly
  end
end