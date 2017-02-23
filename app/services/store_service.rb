class StoreService

  def self.find_all(zip)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,longName,city,phone&apiKey=#{ENV['API_KEY']}")
    JSON.parse(response.body, symbolize_names: true)[:stores]
  end

  def self.find_total(zip)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,longName,city,phone&apiKey=#{ENV['API_KEY']}")
    JSON.parse(response.body, symbolize_names: true)[:total]
  end

end