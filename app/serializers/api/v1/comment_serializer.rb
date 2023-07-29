class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text
  belongs_to :author, class_name: 'User'
  belongs_to :post
end
