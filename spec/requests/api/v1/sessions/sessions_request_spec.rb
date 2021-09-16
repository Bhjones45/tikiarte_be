require 'rails_helper'

describe 'Sessions' do
  describe 'post request' do
    it 'finds a director with email if they exist' do
      director = create(:director)

      post_params = ({
        email: director.email,
        token: director.token,
        google_id: director.google_id
      })
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/sessions/create", headers: headers, params: JSON.generate(director: post_params)

      expect(response).to be_successful

      director_returned = JSON.parse(response.body, symbolize_names: true)[:data]
    end
    
    it 'creates a director with data if they do not exist' do
      post_params = ({
        email: "jacobmarcareer@gmail.com",
        token: "666",
        google_id: "42"
      })
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/sessions/create", headers: headers, params: JSON.generate(director: post_params)
      created_director = Director.last

      expect(response).to be_successful

      director_returned = JSON.parse(response.body, symbolize_names: true)[:data]
    end
  end
end
