class UsersController < ApplicationController
  def create
    name, email, password, password_confirmation = params[:name], params[:email], params[:password], params[:password_confirmation]
    logger.debug('called')
    @user = User.new(
      name: name,
      email: email,
      password: password,
      password_confirmation: password_confirmation
    )

    if @user.save
      render json: {
        'result': 'ok',
        'body': {
          id: @user.id
        }
      }
      cookie.encrypted[:user_id] = { value: @user.id, expires: 30.day }
    else
      render json: {
        'result': 'error',
        'body': {
          'message': 'fail to register'
        }
      }
    end
  end

  private

end
