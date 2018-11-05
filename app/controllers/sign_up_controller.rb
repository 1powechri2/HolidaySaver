class SignUpController < ApplicationController
  def create
    user = User.create(user_params)
    if user
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/'
      flash.alert = "Oh No, You Did Not Get Signed Up Properly.\n
      Try A Different User Name And Make Sure You Fill Out All Fields"
    end
  end

  private
  def user_params
    params.permit(:user_name, :email, :password)
  end
end
