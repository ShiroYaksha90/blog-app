class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :posts_counter
  has_many :posts
  has_many :comments
  has_many :likes
end
