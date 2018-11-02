# frozen_string_literal: true

module SessionsHelper
  def log_in(_user)
    session[:user_id] = User.id
  end
end
