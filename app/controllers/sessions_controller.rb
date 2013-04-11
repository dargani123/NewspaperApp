class SessionsController < ApplicationController

  def new
  end


  def create
    if params[:user][:password] == User.find_by_email(params[:user][:email]).password

      @user = User.find_by_email(params[:user][:email])
      log_in(@user)
      flash[:notice] = "Login successful"
      redirect_to @user
    else
      flash[:notice] = "Bad Log in Info, try again"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to sign_up_url
  end

end
