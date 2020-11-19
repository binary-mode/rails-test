class ApplicationController < ActionController::Base
  helper_method :current_admin
  helper_method :is_admin?

  def current_admin    
    Admin.find_by(id: session[:admin_id])
  end

  def is_admin?   
    !current_admin.nil?  
  end
end
