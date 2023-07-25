require 'rails_helper'
RSpec.describe 'User index page', type: :feature do
  context 'when there are users' do
    before :each do
      @user1 = User.create(name: 'Riyaz Ali', photo: 'riyaz.jpg', bio: 'The developer')
      visit root_path
    end

    it 'shows usernames of all other users' do
      expect(page).to have_content(@user1.name)
    end

    it 'shows the profile picture for each user' do
      expect(page).to have_css("img[src='#{@user1.photo}']")
    end

    it 'shows the number of posts for each user' do
      expect(page).to have_content(@user1.posts_counter)
    end

    it 'redirects to a user show page when a user is clicked on' do
      click_link(@user1.name)
      expect(page).to have_content(@user1.name)
    end
  end
end
