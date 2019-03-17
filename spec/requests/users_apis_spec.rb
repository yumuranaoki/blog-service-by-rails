require 'rails_helper'

RSpec.describe "UsersApis", type: :request do
  describe "POST /signup" do
    it "create a user" do
      user_params = FactoryBot.attributes_for(:user)
      expect {
        post '/signup', params: user_params
      }.to change(User, :count).by(1)
      expect(response).to have_http_status(:success)
    end
  end
end
