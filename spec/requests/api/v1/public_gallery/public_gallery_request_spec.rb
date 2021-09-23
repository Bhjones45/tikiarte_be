require 'rails_helper'

RSpec.describe 'public gallery' do
  describe 'get request' do
    it 'returns all images with public status and ordered by created at ascending' do
      public_images = create_list(:image, 5, status: 'public')
      public_images[1].update(created_at: Time.now)

      private_image = public_images[3]
      private_image.update(status: 'private', title: 'new_title')

      get "/api/v1/public_gallery"

      expect(response).to be_successful

      images = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(images.count).to eq(4)

      images.each do |image|
        expect(image).to have_key(:id)
        expect(image[:attributes]).to have_key(:status)
        expect(image[:attributes]).to have_key(:tags)
        expect(image[:attributes]).to have_key(:description)
        expect(image[:attributes]).to have_key(:title)
        expect(image[:attributes]).to have_key(:artist_id)
        expect(image[:attributes]).to have_key(:status)
        expect(image[:attributes][:title]).to_not eq(private_image.title)
      end

      expect(images[0][:attributes][:title]).to eq(public_images[1].title)
      expect(images[1][:attributes][:title]).to eq(public_images[4].title)
      expect(images[2][:attributes][:title]).to eq(public_images[2].title)
      expect(images[3][:attributes][:title]).to eq(public_images[0].title)
    end
  end
end
