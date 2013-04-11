module SessionsHelper

  def log_in(user)
    user.remember_token = SecureRandom.hex(8)
    session[:remember_token] = user.remember_token
    user.save!
  end

  def current_user
    if session[:remember_token]
      User.find_by_remember_token(session[:remember_token])
    end
  end

  def log_out
    if session[:remember_token]
      User.find_by_remember_token(session[:remember_token]).remember_token = nil
      session[:remember_token] = nil
    else
      flash[:notice] = "already logged out "
    end
  end

end
