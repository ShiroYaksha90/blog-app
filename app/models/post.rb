class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments, foreign_key: 'post_id'
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }
  after_save :update_post_counter


  # Returns the 5 most recent comments for a given post
  def recent_comments
    comments.order('created_at Desc').limit(5)
  end
end
