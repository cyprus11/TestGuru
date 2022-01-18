class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    unless current_user
      session[:redirect_path] = request.original_url
      redirect_to login_path, alert: 'Are you a Guru? Verify your Email and Password.'
    end
  end

  def logged_in?
    current_user.present?
  end
end
