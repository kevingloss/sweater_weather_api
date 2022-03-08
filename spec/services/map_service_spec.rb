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

  describe 'can support road trip' do 
    it 'can get the route given a origin and destination', :vcr do 
      route = MapService.get_route('denver,co', 'pueblo,co')

      expect(route).to be_a(Hash)
      expect(route).to have_key(:route)
      expect(route[:route]).to be_a(Hash)
      expect(route[:route]).to have_key(:realTime)
    end

    it 'returns a route error if you can not drive there', :vcr do 
      route = MapService.get_route('denver,co', 'london,uk')

      expect(route).to be_a(Hash)
      expect(route).to have_key(:route)
      expect(route[:route]).to be_a(Hash)
      expect(route[:route]).to have_key(:routeError)
      expect(route[:route][:routeError]).to be_a(Hash)
      expect(route[:route][:routeError]).to have_key(:errorCode)
      expect(route[:route][:routeError][:errorCode]).to eq(2)
    end
  end
end