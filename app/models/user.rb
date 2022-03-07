class User < ApplicationRecord
  has_many :api_keys
  validates_presence_of :password_digest, :email
  validates :email, email: true, uniqueness: true
  has_secure_password

  before_save { email.try(:downcase!) }
end
