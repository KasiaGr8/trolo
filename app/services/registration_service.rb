class RegistrationService
  attr_reader :alert

  def initialize(params)
    @params = params
  end

  def save
    return false unless valid?
    user.save
    true
  end

  private

  def valid?
    valid_user? && equal_passwords?
  end

  def equal_passwords?
    return true if @params[:password] == @params[:password_confirmation]
    @alert = 'Passwords do not match!'
    false
  end

  def valid_user?
    return true if user.valid?
    @alert = user.errors.full_messages.join(', ')
    false
  end

  def user
    @user ||= User.new(user_params)
  end

  def user_params
    @params.permit(:email, :password)
  end
end
