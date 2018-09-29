module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    session[:role] = user.role
  end

  # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def admin?
    session[:role] == User::ROLE_ADMIN
  end

  def realtor?
    session[:role] == User::ROLE_REALTOR
  end

  def house_hunter?
    session[:role] == User::ROLE_HOUSE_HUNTER
  end

  def switch_role(new_role)
    session[:role] = new_role
  end
end
