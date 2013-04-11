class UsersController < ApplicationController


  def new
    if current_user
      flash[:notice] = "Already signed in"
      redirect_to User.find_by_remember_token(session[:remember_token])
    else
      @user = User.new
      @user.subscriptions.build
    end
  end

  def show

    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if (params[:user][:password] == params[:confirmation]) && @user.save
      flash[:notice] = "Login successful"
      log_in(@user)
      redirect_to @user
    else
      flash[:notice] = @user.errors.full_messages.join
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render :edit
    end
  end

end
