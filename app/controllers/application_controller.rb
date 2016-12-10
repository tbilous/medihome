require 'application_responder'

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :debug_locale if Rails.env.test? || Rails.env.development?
  before_action :configure_permitted_parameters, if: :devise_controller?

  around_action :with_time_zone, if: 'current_user.try(:time_zone)'

  def set_locale
    I18n.locale = extract_locale_header == 'uk' ? 'uk' : 'en'
  end

  def debug_locale
    logger.debug "*!!! Browser locale is '#{extract_locale_header}'"
    logger.debug "*!!! Browser full header '#{extract_full_header}'"
    logger.debug "*!!! Locale set to '#{I18n.locale}'"
  end

  def extract_full_header
    request.env['HTTP_ACCEPT_LANGUAGE'].to_s
  end

  def extract_locale_header
    request.env['HTTP_ACCEPT_LANGUAGE'].to_s.scan(/^[a-z]{2}/).first
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_path, alert: exception.message }
      format.json do
        render json: { error: 'You are not authorized to perform requested action' }.to_json,
               status: :forbidden
      end
      format.js { head :forbidden }
    end
  end


  protected

  def with_time_zone(&block)
    time_zone = current_user.time_zone
    logger.debug "Used user's time zone: #{time_zone}"
    Time.use_zone(time_zone, &block)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
