require 'rails_helper'

describe 'directors artists' do
  describe 'get index request' do
    it 'can return all artists' do
      director = create(:director)
      list = create_list(:artist, 3, director_id: director.id)

      get "/api/v1/directors/#{director.id}/artists"

      expect(response).to be_successful

      returned_artists = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(returned_artists).to eq()
      expect(returned_artists).to have_key()
      expect(returned_artists[:attributes]).to have_key()
      expect(returned_artists[:attributes]).to have_key()
      expect(returned_artists[:attributes]).to have_key()
    end
  end
end
