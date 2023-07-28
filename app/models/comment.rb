class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, foreign_key: 'post_id'

  after_save :update_comments_counter
  before_destroy :decrement_comment

  def decrement_comment
    post.decrement!(:comments_counter)
  end

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
