class ApiKey < ApplicationRecord 
  belongs_to :user

  def self.valid?(key)
    ApiKey.all.include?(key)
  end
end