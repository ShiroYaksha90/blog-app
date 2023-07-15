require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(name: 'Basim', photo: 'https://images.app.goo.gl/myphSgUZVGsHqcsk8', bio: 'Software engineer', posts_counter: 7)
  
  it 'check there is a name' do
    expect(user).to be_valid
    expect(user.name).to eql 'Basim'
  end
  it 'check there is a link for photo' do
    expect(user.photo).to_not eql ''
    expect(user.photo).to eql 'https://images.app.goo.gl/myphSgUZVGsHqcsk8'
  end

  it 'check there is a bio text' do
    expect(user.bio).to_not eql ''
    expect(user.bio).to eql 'Software engineer'
  end

  it 'check there is a number greater than zero for the post counter' do
    
    user.posts_counter = 7
    expect(user).to be_valid
    expect(user.posts_counter).to eql (7)

    user.posts_counter = -2
    expect(user).to_not be_valid
    expect(user.posts_counter).to eql(-2)
  end
  it 'fetch the last three posts' do
    user = User.create(name: 'Basim', photo: 'https://images.app.goo.gl/myphSgUZVGsHqcsk8', bio: 'Software engineer', posts_counter: 6)
    p1 = user.posts.create!(title: 'Post 1', text: 'First post', likes_counter: 3, comments_counter: 1)
    p2 = user.posts.create!(title: 'Post 2', text: 'Second post', likes_counter: 3, comments_counter: 1)
    p3 = user.posts.create!(title: 'Post 3', text: 'Third post', likes_counter: 3, comments_counter: 1)
    p4 = user.posts.create!(title: 'Post 4', text: 'Fourth post', likes_counter: 3, comments_counter: 1)
    p5 = user.posts.create!(title: 'Post 5', text: 'Fifth post', likes_counter: 3, comments_counter: 1)
    p6 = user.posts.create!(title: 'Post 6', text: 'Sixth post', likes_counter: 3, comments_counter: 1)

    expect(user.recent_three_posts).to_not include(p1)
    expect(user.recent_three_posts).to eq([p6,p5,p4])
  end
end