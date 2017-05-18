class RegistrationForm
  include ActiveModel::Model

  attr_accessor :email, :password, :password_confirmation

  validates :email, :password, presence: true
  validate :password_correctness

  def save
    return false unless valid?
    user.save
    true
  end

  private

  def password_correctness
    unless password == password_confirmation
      errors.add(:password, 'do not match!')
    end
  end

  def user
    @user ||= User.new(email: email, password: password)
  end
end # class WsadCreatorForm

