class LogInController < ApplicationController
  def login
    user = User.find_by_user_name(user_params['log_username'])
    if user && user.authenticate(user_params['log_password'])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/'
      flash.alert = "Oh No, You Might Have Input Your User Name or Password Incorrectly."
    end
  end

  private

  def user_params
    params.permit(:log_username, :log_password)
  end
end
