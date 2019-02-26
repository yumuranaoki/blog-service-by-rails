module SessionsHelper
  def read_encrypted_cookie
    user_id = cookies.encrypted[:user_id]
    begin
      @user = User.find(user_id)
    rescue => err
      logger.debug(err)
      render json: {
        success: false,
        body: {
          message: 'fail to load user information'
        }
      }
    end
  end
end