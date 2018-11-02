# frozen_string_literal: true
class Users::SessionsController < ApplicationController
  
#before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
  end

  #POST /resource/sign_in
  def create
    if user = User.find_by(email: params[:user][:email], name: params[:user][:name])
      #if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to '/my_threads'
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      else
      # エラーメッセージを作成する
        flash[:alert] = 'Invalid name/email combination'
        render 'new'
      end
  end

  # DELETE /resource/sign_out
   def destroy
       session[:user_id] = nil
    redirect_to '/'
   end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  #def configure_sign_in_params
  #devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  #end
end
