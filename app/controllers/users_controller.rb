class UsersController < ApplicationController
  def create
    name, email, password, password_confirmation = params[:name], params[:email], params[:password], params[:password_confirmation]
    @user = User.new(
      name: name,
      email: email,
      password: password,
      password_confirmation: password_confirmation
    )

    if @user.save
      cookies.encrypted[:user_id] = {value: @user.id, expires: 30.days, httponly: true}

      render json: {
        success: true,
        body: {
          id: @user.id
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

  private

end
