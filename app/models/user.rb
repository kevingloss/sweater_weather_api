class User < ApplicationRecord
  has_secure_password
  validates_presence_of :password_digest
  validates_presence_of :email
  validates :email, email: true, uniqueness: true
  has_many :api_keys, as: :bearer
end
