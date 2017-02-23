class ItemSerializer < ActiveModel::Serializer
  attributes :status, :id, :name, :description, :image_url

  def status
    action = @instance_options[:template]
    if action == 'index' || 'show'
      "200"
    else
      "404"
    end
  end
end
