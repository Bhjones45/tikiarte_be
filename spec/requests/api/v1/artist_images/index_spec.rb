require 'rails_helper'

describe 'artists images' do
  before :each do
    @artist = create(:artist, :with_images)
  end

  describe 'get images' do
    it 'return all images for an artist' do
      get "/api/v1/artists/#{@artist.id}/images"

      expect(response).to be_successful

      returned_images = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(returned_images.count).to eq(3)

      returned_images.each do |image|
        expect(image).to have_key(:id)
        expect(image).to have_key(:type)
        expect(image[:attributes]).to have_key(:status)
        expect(image[:attributes]).to have_key(:tags)
        expect(image[:attributes]).to have_key(:description)
        expect(image[:attributes]).to have_key(:title)
        expect(image[:attributes]).to have_key(:artist_id)
        expect(image[:attributes]).to have_key(:upload_url)
        expect(image[:attributes][:artist_id]).to eq(@artist.id)
      end

      expected = Image.all.sorted.map { |i| i.title }

      result = returned_images.map { |i| i[:attributes][:title] }

      expect(expected).to eq(result)
    end
  end
end
