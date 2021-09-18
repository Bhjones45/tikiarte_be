require 'rails_helper'

describe 'directors artists' do
  describe 'get index request' do
    it 'can return all artists' do
      director = create(:director)
      list = create_list(:artist, 3, director_id: director.id) 


    end
  end
end
