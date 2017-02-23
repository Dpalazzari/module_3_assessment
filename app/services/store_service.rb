class StoreService

  def self.find_all(zip)
    JSON.parse(response(zip).body, symbolize_names: true)[:stores]
  end

  def self.find_total(zip)
    JSON.parse(response(zip).body, symbolize_names: true)[:total]
  end

  def self.response(zip)
    conn(zip).get do |req|
      req.params['format'] = 'json'
      req.params['show']   = 'storeType,longName,city,phone'
      req.params['apiKey'] = ENV['API_KEY']
    end
  end

  def self.conn(zip)
    Faraday.new(:url => "https://api.bestbuy.com/v1/stores(area(#{zip},25))") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end