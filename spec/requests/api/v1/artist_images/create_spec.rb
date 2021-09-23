require 'rails_helper'

describe 'update directors artists image', type: :request do
  before :each do
    @artist = create(:artist, :with_images)
  end

  describe 'update image status' do
    it 'updates and artist image status' do
      image_params = ({
          title: "happybara",
          description: "happy capybara",
        })

      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/artists/#{@artist.id}/images", headers: headers, params: JSON.generate(image: image_params)

      expect(response).to be_successful

      image = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(image[:type]).to eq('image')
      expect(image[:attributes][:status]).to eq('private')
      expect(image[:attributes][:artist_id]).to eq(@artist.id)
    end
  end
end
