require 'rails_helper'

RSpec.describe Store do
  before(:each) do
    @attributes = {:storeType=>"Mobile SAS", 
                   :longName=>"BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER", 
                   :city=>"DENVER", 
                   :phone=>"303-270-9189"}
    @store = Store.new(@attributes)
  end

  context 'attributes' do
    it 'returns values' do
      expect(@attributes).to be_a(Hash)
      expect(@attributes).to have_key(:storeType)
      expect(@attributes).to have_key(:longName)
      expect(@attributes).to have_key(:city)
      expect(@attributes).to have_key(:phone)
    end
  end

  context '.find_by_zip' do

    before do
      VCR.insert_cassette 'store.find_by_zip', record: :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    it 'returns all stores' do
      stores = Store.find_by_zip('80202')
      store = stores.first
      
      expect(stores).to be_an(Array)
      expect(stores.count).to eq(10)

      expect(store).to be_a(Store)
      expect(store.name).to eq(@attributes[:longName])
      expect(store.city).to eq(@attributes[:city])
      expect(store.phone).to eq(@attributes[:phone])
      expect(store.type).to eq(@attributes[:storeType])
    end
  end

end