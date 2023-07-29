class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :text
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
end
