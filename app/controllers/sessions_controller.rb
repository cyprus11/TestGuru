class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, except: :destroy

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if session[:redirect_path].present?
        redirect_to session[:redirect_path]
        session[:redirect_path] = nil
      else
        redirect_to tests_path
      end
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, alert: 'You just logged out.'
  end
end
