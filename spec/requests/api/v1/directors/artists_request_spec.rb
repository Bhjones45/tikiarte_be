require 'rails_helper'

describe 'directors artists' do
  describe 'get index request' do
    it 'can return all artists' do
      director = create(:director)
      list = create_list(:artist, 3, director_id: director.id)

      get "/api/v1/directors/#{director.id}/artists"

      expect(response).to be_successful

      returned_artists = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(returned_artists[:attributes]).to have_key(:artists)
      expect(returned_artists[:attributes][:artists].count).to eq(3)

      returned_artists[:attributes][:artists].each do |artist|
        expect(artist).to have_key(:id)
        expect(artist).to have_key(:username)
        expect(artist).to have_key(:password_digest)
        expect(artist).to have_key(:director_id)
      end

    end
  end
end
