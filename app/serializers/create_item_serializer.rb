class CreateItemSerializer < ActiveModel::Serializer
  attributes :status, :id, :name, :description, :image_url

  def status
    "201"
  end
end