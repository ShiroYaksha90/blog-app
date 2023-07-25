require 'rails_helper'
describe 'Post index page', type: :feature do
  before :each do
    @user1 = User.create(name: 'Basim', photo: 'basim.jpg', bio: 'SE')
    @user2 = User.create(name: 'Riyaz', photo: 'riyaz.jpg', bio: 'Developer')
    @post1 = Post.create(author: @user1, title: 'Test post', text: 'This is a test post')
    @post2 = Post.create(author: @user1, title: 'post2', text: 'This is a test post2')
    @post3 = Post.create(author: @user1, title: 'a third post', text: 'This is a test post3')
    @post4 = Post.create(author: @user1, title: 'The fourth', text: 'This is a test post4')
    @comment1 = Comment.create(author: @user2, post: @post2, text: 'nice post')
    @comment2 = Comment.create(author: @user2, post: @post4, text: 'good test')
    visit user_posts_path(@user1)
  end

  it 'shows the user profile picture' do
    expect(page).to have_css("img[src='#{@user1.photo}']")
  end

  it 'shows the username of the user' do
    expect(page).to have_content(@user1.name)
  end

  it 'shows the number of posts for the user' do
    expect(page).to have_content(@user1.posts_counter)
  end

  it 'shows the title of posts' do
    expect(page).to have_content(@post2.title)
    expect(page).to have_content(@post4.title)
  end

  it 'shows some of the posts text' do
    expect(page).to have_content(@post1.text)
    expect(page).to have_content(@post2.text)
  end

  it 'shows the first comments of a post' do
    expect(page).to have_content(@comment1.text)
    expect(page).to have_content(@comment2.text)
  end

  it 'shows the number of comments and likes for each post' do
    expect(page).to have_content(@post1.comments_counter)
    expect(page).to have_content(@post4.comments_counter)
    expect(page).to have_content(@post2.likes_counter)
    expect(page).to have_content(@post3.likes_counter)
  end

  it 'redirects to post show page of a clicked post' do
    click_link(@post3.title)
    expect(page).to have_current_path(user_post_path(@user1, @post3))
  end

  it 'redirects to post show page of a clicked post' do
    click_link(@post2.title)
    expect(page).to have_current_path(user_post_path(@user1, @post2))
  end

  context 'when there are more than 5 posts' do
    before :each do
      @post6 = Post.create(author: @user1, title: 'Ruby', text: 'little weird syntax')
      visit user_posts_path(@user1)
    end
  end
end
