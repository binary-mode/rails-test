class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(remember_token: cookies[:remember_token])
  end

  def save_current_user(user)
    @current_user = user
  end

  def sign_out
    cookies[:remember_token] = nil
    @current_user = nil
  end

  def sign_in(user)
    token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s)
    cookies.permanent[:remember_token] = token
    user.remember_token = token
    user.save!
    save_current_user(user)
  end
end
