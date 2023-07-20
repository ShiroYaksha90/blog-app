require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    describe 'posts#index' do
      it 'returns http success for post index' do
        get '/users/index/posts'
        expect(response).to have_http_status(:success)
        expect(response).to render_template('posts/index')
        expect(response.body).to include 'Hello, the posts will be listed here ...'
      end
    end
    describe 'posts#show' do
      it 'returns http success for post show' do
        get '/users/index/posts/index'
        expect(response).to have_http_status(:success)
        expect(response).to render_template('posts/show')
        expect(response.body).to include 'Post details'
      end
    end
  end
end
