class UsersController < ApplicationController
  include SessionsHelper

  before_action :read_encrypted_cookie, only: [:update]

  def create
    name, email, password, password_confirmation = params[:name], params[:email], params[:password], params[:password_confirmation]
    user = User.new(
      name: name,
      email: email,
      password: password,
      password_confirmation: password_confirmation
    )

    if user.save
      cookies.encrypted[:user_id] = {value: user.id, expires: 30.days, httponly: true}

      render json: {
        success: true,
        code: 200,
        body: {
          id: user.id
        }
      }
    else
      render json: {
        success: false,
        code: 500,
        body: {
          message: 'fail to register'
        }
      }
    end
  end

  def update
    name = params[:name]
    if @user.update(name: name)
      render json: {
        success: false,
        code: 200,
        body: {
          name: name 
        }
      }
    else
      render json: {
        success: false,
        code: 500,
        body: {
          message: 'fail to update'
        }
      }
    end

  end

  private

end
