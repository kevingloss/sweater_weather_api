require 'rails_helper'

RSpec.describe ApiKey, type: :model do 
  describe 'relationships' do 
    it { should belong_to :user }
  end
end