class Store

  attr_reader :name, :city, :phone, :type

  def initialize(attributes={})
    @name  = attributes[:longName]
    @city  = attributes[:city]
    @phone = attributes[:phone]
    @type  = attributes[:storeType]
  end

  def self.find_by_zip(zip)
    StoreService.find_all(zip).map do |store|
      new(store)
    end
  end

end