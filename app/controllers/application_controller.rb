class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :authenticate_user!

  def default_url_options
    # I18n.locale == I18n.default_locale ? {} : { lang: I18n.locale }
    { lang: ((I18n.locale == I18n.default_locale) ? nil : I18n.locale) }
  end

  protected

  def after_sign_in_path_for(resource)
    sign_in_path = resource.is_admin? ? admin_tests_path : super

    stored_location_for(resource) || sign_in_path
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
