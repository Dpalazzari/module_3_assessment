require 'rails_helper'

RSpec.describe 'Items API endpoints', type: :request do 
  context 'Get to api/v1/items' do
    it 'returns json of all items' do
      create_list(:item, 10)
      
      get '/api/v1/items'

      items   = JSON.parse(response.body)
      item    = items.first
      db_item = Item.first
      
      expect(response).to be_success
      expect(items).to be_an(Array)
      expect(item).to be_a(Hash)
      expect(item['name']).to eq(db_item.name)
      expect(item).to have_key('id')
      expect(item).to have_key('name')
      expect(item).to have_key('description')
      expect(item).to have_key('image_url')
      expect(item).to_not have_key('created_at')
      expect(item).to_not have_key('updated_at')
    end
  end
end