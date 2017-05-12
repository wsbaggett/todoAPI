class ItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :list_id, :created_at, :updated_at
  
end
