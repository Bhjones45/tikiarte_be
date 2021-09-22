require 'rails_helper'

describe 'delete directors artists image', type: :request do
  before :each do
    @artist = create(:artist, :with_images)
  end

  describe 'update image status' do
    it 'updates and artist image status' do
      image_id = @artist.images.second.id

      delete "/api/v1/artists/#{@artist.id}/images/#{image_id}"

      expect(response).to be_successful

      expect(Image.find_by(id: image_id)).to eq(nil)
    end
  end
end
