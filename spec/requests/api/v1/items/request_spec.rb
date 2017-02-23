require 'rails_helper'

RSpec.describe 'Items API endpoints', type: :request do 
  context 'Get to api/v1/items' do
    it 'returns json of all items' do
      create_list(:item, 10)
      
      get '/api/v1/items'

      items = JSON.parse(response.body)

      expect(response).to be_success
    end
  end
end