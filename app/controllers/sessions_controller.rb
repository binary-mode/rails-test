class SessionsController < ApplicationController
  def new
  end

  def login
    @admin = Admin.find_by(username: params[:username])

    if @admin && @admin.authenticate(params[:password])
        session[:admin_id] = @admin.id
        redirect_to messages_path
    else
        flash[:error] = "Login Failed. Please Try Again."
        redirect_to new_session_path
    end
  end

  def destroy
    return if session[:admin_id].blank?
    
    session.clear
		redirect_to messages_path
  end
end
