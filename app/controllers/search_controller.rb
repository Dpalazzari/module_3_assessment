class SearchController < ApplicationController

  def index
    @presenter = PresentInformation.new(params[:q])
  end

end