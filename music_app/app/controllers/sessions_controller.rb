class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:email], params[:password])
    if @user
      log_in!(@user)
      redirect_to user_url(id: @user)
    else
      @user = User.new
      flash.now['errors'] = ['Email or Password wrong']
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
  end


end
