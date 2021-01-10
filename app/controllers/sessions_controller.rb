
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      flash[:notice] = 'You have successfully signed in'
      sign_in(user)
      redirect_to messages_path
    else
      flash[:notice] = 'Incorrect username or password'
      redirect_to login_path
    end
  end

  def delete
    sign_out
    redirect_to messages_path
  end
end