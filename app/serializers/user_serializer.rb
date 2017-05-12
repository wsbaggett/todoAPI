class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :created_at, :updated_at

  def username
    object.username
  end
end
