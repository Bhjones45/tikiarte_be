require 'rails_helper'

describe 'directors artists' do
  before :each do
    @director = create(:director)
  end

  describe 'get index request' do
    it 'can return all artists' do
      list = create_list(:artist, 3, director_id: @director.id)

      get "/api/v1/directors/#{@director.id}/artists"

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

  describe 'post request' do
    it 'creates artists under a director' do

      post_params = ({
        username: "satan",
        password: "12345"
        })

      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/directors/#{@director.id}/artists", headers: headers, params: JSON.generate(artist: post_params)

      expect(response).to be_successful

      artist = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(artist).to have_key(:id)
      expect(artist).to have_key(:type)
      expect(artist[:attributes]).to have_key(:username)
      expect(artist[:attributes]).to have_key(:password_digest)
      expect(artist[:attributes]).to have_key(:director_id)
    end
  end
end
