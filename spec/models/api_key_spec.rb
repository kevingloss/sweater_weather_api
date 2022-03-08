require 'rails_helper'

RSpec.describe ApiKey, type: :model do 
  describe 'relationships' do 
    it { should belong_to :user }
  end

  describe 'class method' do 
    it 'can validate that an api_key exists' do 
      user_1 = User.create!(email: 'user1@gmail.com', password: '123', password_confirmation: '123')
      key_1 = user_1.api_keys.create!(api_key: SecureRandom.hex)
      user_2 = User.create!(email: 'user2@gmail.com', password: '123', password_confirmation: '123')
      key_2 = user_2.api_keys.create!(api_key: SecureRandom.hex)
      user_3 = User.create!(email: 'user3@gmail.com', password: '123', password_confirmation: '123')
      key_3 = user_3.api_keys.create!(api_key: SecureRandom.hex)

      
      expect(ApiKey.valid?(key_1.api_key)).to eq(true)
      expect(ApiKey.valid?(key_2.api_key)).to eq(true)
      expect(ApiKey.valid?(key_3.api_key)).to eq(true)
      expect(ApiKey.valid?(SecureRandom.hex)).to eq(false)
    end
  end
end