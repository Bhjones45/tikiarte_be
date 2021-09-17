require 'rails_helper'

describe 'directors' do
  describe 'get request' do
    it 'can return a director' do
      director = create(:director)

      get "/api/v1/directors/#{director.id}"

      expect(response).to be_successful
      returned_director = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(returned_director[:id].to_i).to eq(director.id)
      expect(returned_director).to have_key(:attributes)
      expect(returned_director[:attributes]).to have_key(:email)
      expect(returned_director[:attributes]).to have_key(:token)
      expect(returned_director[:attributes]).to have_key(:google_id)
    end
  end
end
