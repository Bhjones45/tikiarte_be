require 'rails_helper'

RSpec.describe 'inspiration' do
  describe 'get request' do
    it 'finds a random image', :vcr do
      get "/api/v1/inspiration"

      expect(response).to be_successful

      image = JSON.parse(response.body, symbolize_names: true)

      expect(image).to have_key(:data)
      expect(image[:data]).to have_key(:url)
      expect(image[:data][:url]).to eq("https://i.picsum.photos/id/1006/500/600.jpg?hmac=8vTJ9Ijrp--dS-_moMUUoqgWF0jv5X8TnGuzuU6sOnw")
    end
  end
end
