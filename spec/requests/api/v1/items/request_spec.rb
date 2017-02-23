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
      expect(item).to have_key('status')
      expect(item['status']).to eq("200")
      expect(item).to have_key('id')
      expect(item).to have_key('name')
      expect(item).to have_key('description')
      expect(item).to have_key('image_url')
      expect(item).to_not have_key('created_at')
      expect(item).to_not have_key('updated_at')
    end
  end

  context 'Get to api/v1/items/1' do
    it 'returns jason of just item params[:id]' do
      create_list(:item, 5)

      get '/api/v1/items/1'

      item = JSON.parse(response.body)
      expect(response).to be_success

      expect(item).to be_a(Hash)
      expect(item).to have_key('id')
      expect(item).to have_key('name')
      expect(item).to have_key('description')
      expect(item).to have_key('image_url')
      expect(item).to have_key('status')
      expect(item['status']).to eq("200")
      expect(item).to_not have_key('created_at')
      expect(item).to_not have_key('updated_at')
    end
  end

  context 'Delete to /api/v1/items/1' do
    it 'returns 204 json response code' do
      create_list(:item, 5)
      expect(Item.count).to eq(5)
      
      delete '/api/v1/items/1'
      
      result = JSON.parse(response.body)

      expect(response).to be_success
      expect(Item.count).to eq(4)
      expect(result).to be_a(Hash)
      expect(result).to have_key('status')
      expect(result['status']).to eq('204')
    end
  end

  context 'Post to /api/v1/items/1' do
    it 'returns 201 code with updated attributes' do
      create_list(:item, 5)
      expect(Item.count).to eq(5)

      post "/api/v1/items?name=bilbo&description=ring_holder&image_url=cool_image.jpeg"

      item = JSON.parse(response.body)
      expect(response).to be_success

      expect(Item.count).to eq(6)
      expect(item).to be_a(Hash)
      expect(item).to have_key('id')
      expect(item).to have_key('name')
      expect(item).to have_key('description')
      expect(item).to have_key('image_url')
      expect(item).to have_key('status')
      expect(item['status']).to eq("201")
      expect(item['name']).to eq('bilbo')
      expect(item['description']).to eq('ring_holder')
      expect(item['image_url']).to eq('cool_image.jpeg')
      expect(item).to_not have_key('created_at')
      expect(item).to_not have_key('updated_at')
    end
  end
end