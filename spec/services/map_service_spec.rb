require 'rails_helper'

RSpec.describe MapService do 
  describe 'can support forecast' do 
    it 'can get the lat/lon given a city/state', :vcr do
      service = MapService.get_coords('Boston,MA')

      expect(service).to be_a(Hash)
      expect(service).to have_key(:results)
      expect(service[:results]).to be_a(Array)
      expect(service[:results].first).to have_key(:locations)
      expect(service[:results].first[:locations]).to be_a(Array)
      expect(service[:results].first[:locations].first).to have_key(:latLng)
      expect(service[:results].first[:locations].first[:latLng]).to have_key(:lat)
      expect(service[:results].first[:locations].first[:latLng]).to have_key(:lng)
    end
  end
end