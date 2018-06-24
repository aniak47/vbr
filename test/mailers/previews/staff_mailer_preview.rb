# Preview all emails at http://localhost:3000/rails/mailers/staff_mailer
class StaffMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/staff_mailer/account_activation
  def account_activation
    staff = Staff.first
    staff.activation_token = Staff.new_token
    StaffMailer.account_activation(staff)
  end

  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    user = Staff.first
    user.reset_token = User.new_token
    UserMailer.password_reset(user)
  end

end
