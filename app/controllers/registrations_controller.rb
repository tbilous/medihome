class RegistrationsController < Devise::RegistrationsController
  respond_to :html, :json, :js
  before_action :success_registration, only: [:create]

  def success_registration
    flash[:success] = t('devise.registrations.signed_up')
  end
end
