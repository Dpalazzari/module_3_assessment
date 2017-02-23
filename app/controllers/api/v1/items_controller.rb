class Api::V1::ItemsController < ApplicationController

  def index
    items = Item.all
    render json: items
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def create
    item = Item.create(item_params)
    render json: item, serializer: CreateItemSerializer
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render json: item, serializer: DeleteItemSerializer
  end

  private

  def item_params
    params.permit(:name, :description, :image_url)
  end

end