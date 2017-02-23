class Store


  def self.find_by_zip(zip)
    StoreService.find_all(zip).map do |store|
      new(store)
    end
  end

end