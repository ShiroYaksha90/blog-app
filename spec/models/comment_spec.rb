require 'rails_helper'

RSpec.describe Comment, type: :model do
  comment = Comment.new(author_id: 1, post_id: 1, text: 'Hi Tom!')

  it 'checks there is a author id' do
    expect(comment.author_id).to_not eql(-1)
    expect(comment.author_id).to eql 1
  end

  it 'checks there is a post id' do
    expect(comment.post_id).to_not eql(-2)
    expect(comment.post_id).to eql 1
  end

  it 'checks there is a comment' do
    comment.text = ''
    expect(comment.text).to_not eql 'Hi Tom!'
  end

  it '#update_comments_counter' do
    User.new(name: 'Basim', photo: 'https://images.app.goo.gl/myphSgUZVGsHqcsk8', bio: 'Software engineer',
             posts_counter: 5)

    post = Post.new(author_id: 1, title: 'Hello', text: 'Hello this is my first post', comments_counter: 3,
                    likes_counter: 2)

    comment = Comment.new(author_id: 1, post:, text: 'Hi Tom!')

    post.comments_counter = 0
    post.save

    comment.update_comments_counter
    comment.update_comments_counter

    expect(post.comments_counter).to eq(2)
  end
end
