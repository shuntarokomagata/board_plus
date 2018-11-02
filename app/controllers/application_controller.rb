# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # protected
  # def configure_permitted_parameters
  #  devise_parameter_sanitizer.for(:sign_up) << :username
  # end

  def after_sign_in_path_for(_resource)
    my_threads_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(_resource)
    root_path # ログアウト後に遷移するpathを設定
  end
end
