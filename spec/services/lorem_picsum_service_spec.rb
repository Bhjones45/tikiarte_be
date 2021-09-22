require 'rails_helper'

RSpec.describe LoremPicsumService, :vcr do
  it 'returns a random picture' do
    response = LoremPicsumService.random_picture
    expect(response).to be_a(String)
    expect(response).to eq("https://i.picsum.photos/id/613/500/600.jpg?hmac=4Kr7eXuL6GBDyILaSeXYCBGdtZuPVB7IOpljt5G_vI0")
  end
end
