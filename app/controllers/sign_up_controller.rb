class SignUpController < ApplicationController
  def create
    if user_params[:user_name] == "" || user_params[:email] == ""
      flash.alert = "Oh No, You Did Not Get Signed Up Properly.\n
      Try A Different User Name And Make Sure You Fill Out All Fields"
      redirect_to '/'
    else
      user = User.create(user_params)
      session[:user_id] = user.id
      SignUpMailer.new(user_params).send_mail
      redirect_to '/'
    end
  end

  private
  def user_params
    params.permit(:user_name, :email, :password)
  end
end
