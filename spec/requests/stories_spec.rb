# frozen_string_literal: true
require 'rails_helper'

describe 'Stories API', type: :request do
  describe 'GET /stories' do
    before do
      FactoryBot.create(:story, title: 'Book 1', body: 'bla bla bla bla')
      FactoryBot.create(:story, title: 'Book 2', bodybody: 'bla bla bla bla')
    end
    it 'should return all stories' do
      get '/api/v1/stories'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe 'POST /stories' do
    it 'should create a new story' do
      expect {
        post '/api/v1/stories', params: {
          story: { title: 'Story title', body: 'bla bla bla bla' },
          user: { username: 'Ahmed' }
        }
      }.to change { Story.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
      expect(User.count).to eq(1)
    end
  end

  describe 'DELETE /stories/:id' do
    let!(:story) { FactoryBot.create(:story, title: 'Book 1', body: 'bla bla bla bla') }
    it 'should delete a story' do
      expect {
        delete "/api/v1/stories/#{story.id}"
      }.to change { Story.count }.from(1).to(0)
      expect(response).to have_http_status(:no_content)
    end
  end
end
