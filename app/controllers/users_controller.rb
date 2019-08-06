class UsersController < ApplicationController

  

  def index
  end

  def create
    @user=User.new(name: params[:name], password: params[:password])
    @user.save
    session[:user_id] = @user.id
    session[:user_name] = @user.name
    redirect_to("/")
  end

  def welcome
  end

  def list
    @users = User.all.order(created_at: :desc)
  end

  def login_form

  end

  def login
    @user = User.find_by(name: params[:name], password: params[:password])
    if @user
      session[:user_id] = @user.id
      session[:user_name] = @user.name
      redirect_to("/")
    else
      @error_message = "名前とパスワードが一致しません"
      render("/users/login_form")
    end
  end

  def logout
    session[:user_name] = nil
    redirect_to("/users/login")
  end


end
