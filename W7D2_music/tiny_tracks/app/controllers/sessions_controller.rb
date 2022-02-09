class SessionsController < ApplicationController
  #when user logs in successfully the session is created
  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ['Wrong password or username. Please try again.']
      render new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  def new
    @user = User.new
    render :new
  end
end
