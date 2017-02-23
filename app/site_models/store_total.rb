class StoreTotal

  attr_reader :total

  def initialize(total={})
    @total = total
  end

  def self.find_total(zip)
    total = StoreService.find_total(zip)
    new(total)
  end

end