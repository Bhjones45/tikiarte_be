require 'rails_helper'

describe 'update directors artists image', type: :request do
  before :each do
    @artist = create(:artist, :with_images)
  end

  describe 'update image status' do
    it 'updates and artist image status' do
      image_params = ({
          status: 'public'
        })

      headers = { "CONTENT_TYPE" => "application/json" }

      put "/api/v1/artists/#{@artist.id}/images/#{@artist.images.second.id}", headers: headers, params: JSON.generate(image: image_params)

      expect(response).to be_successful

      image = JSON.parse(response.body, symbolize_names: true)

      expect(image[:status]).to eq('public')
    end

    it 'updates all image attributes' do
      image_params = ({
          status: 'public',
          description: 'New description',
          tags: 'new_tag',
          title: 'New Title'
        })

      headers = { "CONTENT_TYPE" => "application/json" }

      put "/api/v1/artists/#{@artist.id}/images/#{@artist.images.second.id}", headers: headers, params: JSON.generate(image: image_params)

      expect(response).to be_successful

      image = JSON.parse(response.body, symbolize_names: true)

      expect(image[:status]).to eq('public')
      expect(image[:description]).to eq('New description')
      expect(image[:tags]).to eq('new_tag')
      expect(image[:title]).to eq('New Title')
    end
  end
end
