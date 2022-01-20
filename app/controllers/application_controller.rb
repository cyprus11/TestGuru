class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    sign_in_path = resource.is_admin? ? admin_tests_path : super

    stored_location_for(resource) || sign_in_path
  end
end
