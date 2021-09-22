require 'rails_helper'

RSpec.describe 'public gallery' do
  describe 'get request' do
    it 'returns all images with public status' do
      public_images = create_list(:image, 3, status: 'public')
      private_image = create(:image)

      get "/api/v1/public_gallery"

      expect(response).to be_successful

      images = JSON.parse(response.body, symbolize_names: true)

      expect(images[:data].count).to eq(3)

      images[:data].each do |image|
        expect(image).to have_key(:id)
        expect(image[:attributes]).to have_key(:status)
        expect(image[:attributes]).to have_key(:tags)
        expect(image[:attributes]).to have_key(:description)
        expect(image[:attributes]).to have_key(:title)
        expect(image[:attributes]).to have_key(:artist_id)
        expect(image[:attributes]).to have_key(:status)
        expect(image[:attributes][:title]).to_not eq(private_image.title)
      end
    end
  end
end
