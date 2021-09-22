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

      image_id = @artist.images.second.id

      put "/api/v1/artists/#{@artist.id}/images/#{image_id}", headers: headers, params: JSON.generate(image: image_params)

      expect(response).to be_successful

      image = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(image[:id]).to eq(image_id.to_s)
      expect(image[:type]).to eq('image')
      expect(image[:attributes][:status]).to eq('public')
      expect(image[:attributes][:artist_id]).to eq(@artist.id)
    end

    it 'updates all image attributes' do
      image_params = ({
          status: 'public',
          description: 'New description',
          tags: 'new_tag',
          title: 'New Title'
        })

      image_id = @artist.images.second.id

      headers = { "CONTENT_TYPE" => "application/json" }

      put "/api/v1/artists/#{@artist.id}/images/#{image_id}", headers: headers, params: JSON.generate(image: image_params)

      expect(response).to be_successful

      image = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(image[:id]).to eq(image_id.to_s)
      expect(image[:type]).to eq('image')
      expect(image[:attributes][:status]).to eq('public')
      expect(image[:attributes][:description]).to eq('New description')
      expect(image[:attributes][:tags]).to eq('new_tag')
      expect(image[:attributes][:title]).to eq('New Title')
      expect(image[:attributes][:artist_id]).to eq(@artist.id)
    end
  end
end
