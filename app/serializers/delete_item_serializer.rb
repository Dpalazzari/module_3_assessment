class DeleteItemSerializer < ActiveModel::Serializer
  attributes :message

  def message
    if @instance_options[:template] == 'destroy'
      "204"
    end
  end
end