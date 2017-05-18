class RegistrationsController < ApplicationController
  skip_before_action :authenticate_user

  def new
  end

  def create
    service = RegistrationForm.new(registration_params)
    if service.save
      redirect_to new_session_path, notice: 'Successfully signed up please log in!'
    else
      redirect_to new_registration_path, alert: service.errors.full_messages.join(', ')
    end
  end

  private

  def registration_params
    params.permit(:email, :password, :password_confirmation)
  end
end