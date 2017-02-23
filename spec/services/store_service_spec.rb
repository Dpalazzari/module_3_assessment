require 'rails_helper'

RSpec.describe StoreService do
  scenario 'returns all stores in a zipcode radius of 25 miles' do
    VCR.use_cassette("store_service.find_all(zip)") do
      raw_stores = StoreService.find_all('80202')
      
      expect(raw_stores).to be_an(Array)
      expect(raw_stores.count).to eq(10)

      store = raw_stores.first

      expect(store).to be_a(Hash)
      expect(store).to have_key(:storeType)
      expect(store).to have_key(:longName)
      expect(store).to have_key(:city)
      expect(store).to have_key(:phone)
    end
  end
end