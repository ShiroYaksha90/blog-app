require 'rails_helper'

RSpec.describe Like, type: :model do
  like = Like.new(author_id: 1, post_id: 1)

  it 'checks there is a author id' do
    expect(like.author_id).to eql 1
  end

  it 'checks there is a post id' do
    expect(like.post_id).to eql 1
  end

  it '#update_likes_counter' do
  post = Post.create(author_id: 1, title: 'Hello', text: 'Hello This is my first post', likes_counter: 1)
  Like.create(author_id: 1, post_id: post.id)

  expect(post.likes_counter).to eql 1
  end
end
