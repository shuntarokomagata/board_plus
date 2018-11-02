module SessionsHelper

  def log_in(user)
    session[:user_id] = User.id
  end

end
