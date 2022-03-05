require 'rails_helper'

RSpec.describe Map do 
  it 'has attributes' do 
    data = {
      "results": [
        {
            "providedLocation": {
                "location": "boston,ma"
            },
            "locations": [
                {
                    "latLng": {
                        "lat": 42.358894,
                        "lng": -71.056742
                    }
                }
            ]
          }
        ]
      }

      coord = Map.new(data)

      expect(coord.lat).to eq(42.358894)
      expect(coord.lon).to eq(-71.056742)
  end
end