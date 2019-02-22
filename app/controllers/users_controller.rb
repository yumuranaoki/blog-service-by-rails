class UsersController < ApplicationController
  def create
    [name, email, password, password_confirmation] = params[:name], params[:email], params[:password], params[:password_confirmation]
    @user = User.new(
      name: name,
      email: email,
      password: password,
      password_confirmation: password_confirmation
    )

    if @user.save
      render json: {
        'result': 'ok',
        'userId': @user.id
      }
      session[:user_id] = @user.id
    else
      render json: {
        'result': 'error',
        'message': 'fail to register'
      }
    end
  end

  private

end
