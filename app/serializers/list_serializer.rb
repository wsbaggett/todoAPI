class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :permissions, :user_id, :created_at, :updated_at
  
end
