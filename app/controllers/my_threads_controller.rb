# frozen_string_literal: true

class MyThreadsController < ApplicationController
  before_action :login_check, only: [:index]

  def index
    @my_threads = MyThread.all.order(created_at: 'desc')
    @myid = session[:user_id]
  end

  def new
    @my_thread = MyThread.new
  end

  def create
    @my_thread = MyThread.new(my_thread_params)
    @my_thread[:user_id] = session[:user_id]
    if @my_thread.save
      redirect_to my_threads_path
    else
      render 'new'

    end
  end

  def edit
    @my_thread = MyThread.find(params[:id])
  end

  def update
    @my_thread = MyThread.find(params[:id])
    if @my_thread.update(my_thread_params)
      redirect_to my_threads_path
    else
      render 'edit'
    end
  end

  def destroy
    @my_thread = MyThread.find(params[:id])
    @my_thread.destroy
    redirect_to my_threads_path
  end

  private

  def login_check
    if session[:user_id].nil?
      flash[:alert] = 'ログインしてください'
      redirect_to '/'
    end
  end

  def my_thread_params
    params.require(:my_thread).permit(:title, :text, :user_id)
  end
end
