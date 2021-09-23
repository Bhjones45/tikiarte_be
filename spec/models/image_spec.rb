require 'rails_helper'

RSpec.describe Image, type: :model do
  describe "associations" do
    it { should belong_to :artist }
  end
  describe 'class methods' do
    describe '#find_public_images' do
      it 'can return all public images by most recent' do
        image1 = create(:image, status: 'public', created_at: '2021-09-25')
        image2 = create(:image, status: 'public', created_at: '2021-09-24')
        image3 = create(:image, status: 'public', created_at: '2021-09-26')

        expect(Image.find_public_images).to eq([image3, image1, image2])
      end
    end

    describe '#sorted' do
      it 'returns images sorted by created at order ascending' do
        images = create_list(:image, 5)
        images[1].update(created_at: Time.now)

        expected = [Image.all.second.title, Image.all.fifth.title, Image.all.fourth.title, Image.all.third.title, Image.all.first.title]


        result = Image.sorted.map { |i| i.title }

        expect(expected).to eq(result)
      end
    end
  end
end
