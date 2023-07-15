require 'rails_helper'

RSpec.describe Post, type: :model do
  post = Post.new(author_id: 1, title: 'Hello', text: 'Hello this is my first post', comments_counter: 3,
                  likes_counter: 2)

  it 'checks is there a author id' do
    expect(post.author_id).to eql 1
  end

  it 'checks is there a title for post' do
    post.title = ''
    expect(post).to_not be_valid
    expect(post.title).to eql ''
  end

  it 'Title must not exceed 250 characters.' do
    post.title = 'Hello' * 100
    expect(post).to_not be_valid
    expect(post.title.length).to eql 500
  end

  it 'checks is there a text' do
    expect(post.text).to_not eql ''
    expect(post.text).to eql 'Hello this is my first post'
  end

  it 'counter validation' do
    post.comments_counter = -3
    expect(post).to_not be_valid
    post.comments_counter = 5
    expect(post.comments_counter).to eql 5
  end

  it 'likes counter validation' do
    post.likes_counter = -5
    expect(post).to_not be_valid
  end

  it '#update_post_counter' do
    user = User.create!(name: 'Basim', posts_counter: 0)

    post = user.posts.create!(title: 'Hello', text: 'Hello this is a post', comments_counter: 3, likes_counter: 2)

    post.update_post_counter
    post.update_post_counter
    post.update_post_counter

    user.reload

    expect(user.posts_counter).to eq(4)
  end

  it 'fetch the last five comments for the post' do
    user = User.create!(name: 'Basim', photo: 'https://images.app.goo.gl/myphSgUZVGsHqcsk8', bio: 'Software engineer',
                        posts_counter: 6)

    post = user.posts.create!(title: 'first post', text: 'this is the first post', comments_counter: 3,
                              likes_counter: 2)

    post.comments.create!(author_id: user.id, text: 'First comment')
    c2 = post.comments.create!(author_id: user.id, text: 'Second comment')
    c3 = post.comments.create!(author_id: user.id, text: 'Third comment')
    c4 = post.comments.create!(author_id: user.id, text: 'Fourth comment')
    c5 = post.comments.create!(author_id: user.id, text: 'Fifth comment')
    c6 = post.comments.create!(author_id: user.id, text: 'Sixth comment')

    expect(post.recent_comments).to eq([c6, c5, c4, c3, c2])
  end
end
