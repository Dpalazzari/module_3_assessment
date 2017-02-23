class ItemSerializer < ActiveModel::Serializer
  attributes :status, :id, :name, :description, :image_url

  def status
    action = @instance_options[:template]
    if action == 'index' || 'show'
      "200"
    elsif action == 'destroy'
      "204"
    elsif action == 'update'
      "201"
    else
      "404"
    end
  end
end
