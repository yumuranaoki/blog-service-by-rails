require 'rails_helper'

RSpec.describe "PostsApis", type: :request do
  describe "GET /posts_apis" do
    it "create a post" do
      @user = FactoryBot.create(:user)
      post_params = FactoryBot.attributes_for(:post)
      expect{
        post '/posts', params: post_params
      }.to change(@user.posts, :count).by(1)
    end
  end
end
