require 'rails_helper'

RSpec.describe MapFacade do 
  it 'returns a map with coords', :vcr do 
    coords = MapFacade.get_coords('boston,ma')

    expect(coords).to be_an_instance_of(Map)
    expect(coords.lat).to eq(42.358894)
    expect(coords.lon).to eq(-71.056742)
  end
end