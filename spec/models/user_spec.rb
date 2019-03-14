require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it "is valid with name, email, password, and password_confirmation" do
    expect(@user).to be_valid  
  end

  it "is invalid without email" do
    user = FactoryBot.build(:user,  email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
end
