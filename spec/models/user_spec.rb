require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do 
    it { should have_many :api_keys }
  end

  describe 'validations' do 
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password_digest }
    it { should have_secure_password }
  end

  it 'authenticates' do 
    user = User.create!(email: 'user@gmail.com', password: '123', password_confirmation: '123')
    
    expect(user.authenticate('123')).to eq(user)
    expect(user.authenticate('password')).to eq(false)
  end

  it 'has attributes' do 
    user = User.create!(email: 'User@gmail.com', password: '123', password_confirmation: '123')
    
    expect(user.email).to eq('user@gmail.com')
    expect(user).to_not have_attribute(:password)
    expect(user.password_digest).to_not eq('123')
    expect(user.api_keys).to eq([])

    user.api_keys.create!(api_key: SecureRandom.hex)

    expect(user.api_keys.count).to eq(1)
  end
end
