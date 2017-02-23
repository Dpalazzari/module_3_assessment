class SearchController < ApplicationController

  def index
    zip     = params[:q]
    @stores = Store.find_by_zip(zip)
    @total  = StoreTotal.find_total(zip)
  end

end