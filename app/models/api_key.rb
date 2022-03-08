class ApiKey < ApplicationRecord 
  belongs_to :user

  def self.valid?(key)
    if where(api_key: key).empty? == false
      where(api_key: key).first.api_key == key
    else
      false
    end
  end
end