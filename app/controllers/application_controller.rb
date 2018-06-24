class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include CalenderHelper
  
  private
    # Confirms a logged-in user.
    def logged_in_staff
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
     # Confirms an admin user.
    def admin_staff
      redirect_to(root_url) unless current_staff.admin?
    end
end
