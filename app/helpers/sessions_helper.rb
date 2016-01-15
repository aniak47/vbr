module SessionsHelper
  # Logs in the given user.
  def log_in(staff)
    session[:staff_id] = staff.id
  end
  # Returns the current logged-in user (if any).
  def current_staff
    @current_staff ||= Staff.find_by(id: session[:staff_id])
  end
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_staff.nil?
  end
  # Logs out the current user.
  def log_out
    session.delete(:staff_id)
    @current_staff = nil
  end
  # Returns true if the given user is the current user.
  def current_staff?(staff)
    staff == current_staff
  end
  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
