class StoreService

  def self.find_all(zip)
    response = Faraday.get('https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeType,longName,city,phone&apiKey=')
  end

end