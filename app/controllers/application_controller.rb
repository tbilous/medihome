class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :debug_locale if Rails.env.test? || Rails.env.development?

  def set_locale
    I18n.locale = (extract_locale_header == ('uk' || 'ru') ? 'ru' : 'en')
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
end
