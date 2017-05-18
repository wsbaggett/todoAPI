class ItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :completed

  def description
    object.description
  end

  def completed
    object.completed
  end
end
