class DeleteItemSerializer < ActiveModel::Serializer
  attributes :status

  def status
    if @instance_options[:template] == 'destroy'
      "204"
    end
  end
end