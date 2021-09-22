require 'rails_helper'

RSpec.describe Image, type: :model do
  describe "associations" do
    it { should belong_to :artist }
  end
  describe 'class methods' do
    describe '.find_public_images' do
      it 'can return all public images by most recent' do
        image1 = create(:image, status: 'public', created_at: '2021-09-25')
        image2 = create(:image, status: 'public', created_at: '2021-09-24')
        image3 = create(:image, status: 'public', created_at: '2021-09-26')

        expect(Image.find_public_images).to eq([image3, image1, image2])
      end
    end
  end
end
