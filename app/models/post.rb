class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments, foreign_key: 'post_id'

  after_save :update_post_counter

  # Updates the posts counter for a user
  def update_post_counter
    author.increment!(:posts_counter)
  end

  # Returns the 5 most recent comments for a given post
  def recent_comments
    comments.order('created_at Desc').limit(5)
  end
end
