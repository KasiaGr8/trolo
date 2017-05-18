class SessionsController < ApplicationController
  skip_before_action :authenticate_user
  before_action :redirect_to_root_when_logged_in, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to boards_path, notice: 'Logged in!'
    else
      flash.now.alert = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to boards_path, notice: 'Logout!'
  end

  private

  def redirect_to_root_when_logged_in
    if current_user.present?
      redirect_to boards_path, alert: 'You are already signed in!'
    end
  end
end