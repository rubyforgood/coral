class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  around_action :set_locale

  protected

  def set_locale(&action)
    locale = params[:locale].to_s.strip.to_sym
    if (!I18n.available_locales.include?(locale))
      locale = I18n.default_locale
    end
    I18n.with_locale(locale, &action)
  end

  def default_url_options(options = {})
    # options.merge(locale: I18n.locale)
    { locale: I18n.locale == I18n.default_locale ? I18n.default_locale : I18n.locale }
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password password_confirmation current_password])
  end
end
