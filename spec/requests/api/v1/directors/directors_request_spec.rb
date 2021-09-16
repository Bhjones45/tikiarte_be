require 'rails_helper'

describe 'directors' do
  describe 'get request' do
    it 'can return a director' do
      director = create(:director)

      get "/api/v1/directors/#{director.id}"

      expect(response).to be_successful
      returned_director = JSON.parse(response.body, symbolize_names: true)[:data]


    end
  end
end
