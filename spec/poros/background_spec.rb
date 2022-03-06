require 'rails_helper'

RSpec.describe Background do 
  it 'has attributes' do 
    data = {
      "id": "51920565621",
      "owner": "151111185@N04",
      "secret": "75ff0825a7",
      "server": "65535",
      "farm": 66,
      "title": "CT-1 Over The Diamond",
      "ispublic": 1,
      "isfriend": 0,
      "isfamily": 0
    }
      
    background = Background.new(data, 'boston, ma')

    expect(background.id).to eq(nil)
    expect(background.location).to eq('boston, ma')
    expect(background.image_url).to eq("https://live.staticflickr.com/65535/51920565621_75ff0825a7.jpg")
    expect(background.credit).to eq({:author=>"ID: 151111185@N04", :source=>"flickr.com"})
  end
end