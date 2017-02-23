class StoreTotal

  attr_reader :count

  def initialize(total={})
    @count = total
  end

  def self.find_total(zip)
    total = StoreService.find_total(zip)
    new(total)
  end

end