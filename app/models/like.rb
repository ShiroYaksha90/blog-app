class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :posts

  def update_likes_counter
    post.increment(:likes_counter)
  end
end
