class SessionsController < ApplicationController
  def create
    email, password = params[:email], params[:password]
    user = User.find_by(email: email).try(:authenticate, password)
    if user
      cookies.encrypted[:user_id] = {value: user.id, expires: 30.days, httponly: true}
      render json: {
        success: true,
        code: 200,
        body: {
          message: 'success to authenticate'
        }
      }
    else
      render json: {
        success: false,
        code: 401,
        body: {
          message: 'fail to authenticate'
        }
      }
    end
  end

  def destroy
    cookies[:user_id] = nil
  end
end
