module SessionsHelper
  # Logs in the given user.
  def log_in(staff)
    session[:staff_id] = staff.id
  end
  # Returns the current logged-in user (if any).
  def current_staff
    if (staff_id = session[:staff_id])
      @current_staff ||= Staff.find_by(id: staff_id)
    elsif (staff_id = cookies.signed[:staff_id])
      staff = Staff.find_by(id: staff_id)
      if staff && staff.authenticated?(cookies[:remember_token])
        log_in staff
        @current_staff = staff
      end
    end
  end
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_staff.nil?
  end
  # Logs out the current user.
  def log_out
    forget(current_staff)
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
  # Remembers a user in a persistent session.
  def remember(staff)
    staff.remember
    cookies.permanent.signed[:staff_id] = staff.id
    cookies.permanent[:remember_token] = staff.remember_token
  end
  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
  # Forgets a persistent session.
  def forget(staff)
    staff.forget
    cookies.delete(:staff_id)
    cookies.delete(:remember_token)
  end
end
