require 'rails_helper'

RSpec.describe ImageService do 
  it 'returns image details from flickr', :vcr do 
    service = ImageService.get_background('boston, ma')

    expect(service[:photos][:photo].first).to have_key(:id)
    expect(service[:photos][:photo].first).to have_key(:owner)
    expect(service[:photos][:photo].first).to have_key(:secret)
    expect(service[:photos][:photo].first).to have_key(:server)
  end
end