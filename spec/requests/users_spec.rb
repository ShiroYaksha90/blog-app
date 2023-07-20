require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    describe 'users#index' do
      it 'returns http success for index' do
        get users_path
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:index)
        expect(response.status).to eq(200)
        expect(response.body).to include 'Hello, the users will be listed here...'
      end
    end
    describe 'users#show' do
      it 'returns http success for show' do
        get '/users/index'
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:show)
        expect(response.status).to eq(200)
        expect(response.body).to include 'User details'
      end
    end
  end
end
