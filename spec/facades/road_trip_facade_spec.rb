require 'rails_helper'

RSpec.describe RoadTripFacade do 
  it 'returns a road trip', :vcr do 
    road_trip = RoadTripFacade.get_road_trip('boston,ma', 'denver,co')

    expect(road_trip).to be_an_instance_of(RoadTrip)
    expect(road_trip.id).to eq(nil)
    expect(road_trip.start_city).to eq('boston,ma')
    expect(road_trip.end_city).to eq('denver,co')
    expect(road_trip.travel_time).to be_a(String)
    expect(road_trip.weather_at_eta.keys).to eq([:temperature, :conditions])
  end

  it 'returns no weather or eta if trip is impossible', :vcr do 
    road_trip = RoadTripFacade.get_road_trip('boston,ma', 'london,uk')

    expect(road_trip).to be_an_instance_of(RoadTrip)
    expect(road_trip.id).to eq(nil)
    expect(road_trip.start_city).to eq('boston,ma')
    expect(road_trip.end_city).to eq('london,uk')
    expect(road_trip.travel_time).to eq('impossible route')
    expect(road_trip.weather_at_eta).to eq({})
  end
end