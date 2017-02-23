class PresentInformation

  attr_reader :zip

  def initialize(zip_code)
    @zip = zip_code
  end

  def stores
    Store.find_by_zip(zip)
  end

  def total
    StoreTotal.find_total(zip)
  end

end