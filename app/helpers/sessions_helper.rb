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
end
