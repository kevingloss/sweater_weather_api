require 'rails_helper'

RSpec.describe BackgroundFacade do 
  it 'returns a background image', :vcr do 
    background = BackgroundFacade.get_background('boston, ma')

    expect(background).to be_an_instance_of(Background)
  end

  it 'returns an error if no image found', :vcr do 
    background = BackgroundFacade.get_background('akshgai;eoirg0gij')

    expect(background).to eq(nil)
  end
end